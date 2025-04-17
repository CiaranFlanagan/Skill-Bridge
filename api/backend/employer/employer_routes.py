from flask import Blueprint, request, jsonify, make_response, current_app, send_file
from backend.db_connection import db
import io

# make new blueprint for employer routes
employer_routes = Blueprint('employer_routes', __name__)

# endpoint for when a employer posts a new job
@employer_routes.route('/job-postings', methods=['POST'])
def create_job_posting():
    current_app.logger.info('POST /job-postings route')
    job_details = request.get_json()
    insert_query = '''
        INSERT INTO job_postings (employer_id, title, status, posted_date)
        VALUES (%s, %s, %s, NOW())
    '''
    db_cursor = db.get_db().cursor()
    db_cursor.execute(insert_query, (job_details['employer_id'], job_details['title'], job_details['status']))
    db.get_db().commit()
    job_id = db_cursor.lastrowid
    select_query = '''
        SELECT jp.id, jp.title, jp.status, jp.posted_date, e.company_name, jp.employer_id
        FROM job_postings jp
        JOIN employers e ON jp.employer_id = e.user_id
        WHERE jp.id = %s
    '''
    db_cursor.execute(select_query, (job_id,))
    job_info = db_cursor.fetchone()

    response = make_response(jsonify(job_info))
    response.status_code = 201
    return response


# endpoint to get job postings for a given employer_id
@employer_routes.route('/job-postings', methods=['GET'])
def get_job_postings():
    current_app.logger.info('GET /job-postings route')
    employer_id = request.args.get('employer_id', type=int)
    cursor = db.get_db().cursor()
    query = '''
        SELECT jp.id, jp.title, jp.status, jp.posted_date,
               e.company_name, jp.employer_id
        FROM job_postings jp
        JOIN employers e ON jp.employer_id = e.user_id
        WHERE jp.employer_id = %s
    '''
    cursor.execute(query, (employer_id,))
    jobs = cursor.fetchall()

    response = make_response(jsonify(jobs))
    response.status_code = 200
    return response

# endpoint for filtering students by major, skillset, and GPA
@employer_routes.route('/filter-students', methods=['GET'])
def filter_students():
    current_app.logger.info('GET /filter-students route')
    major = request.args.get('major')
    gpa = request.args.get('gpa', type=float)
    skills = request.args.getlist('skills')
    if len(skills) == 1 and ',' in skills[0]:
        skills = [s.strip() for s in skills[0].split(',') if s.strip()]
    employer_id = request.args.get('employer_id', type=int)
    db_cursor = db.get_db().cursor()
    base_query = '''
        SELECT s.user_id, u.first_name, u.last_name, m.name AS major_name, s.gpa
        FROM students s
        JOIN users u ON s.user_id = u.id
        JOIN majors m ON m.id = s.major_id
        WHERE 1=1
    '''
    params = []
    if major:
        base_query += ' AND m.name = %s'
        params.append(major)
    if gpa:
        base_query += ' AND s.gpa >= %s'
        params.append(gpa)
    if skills:
        skill_placeholders = ','.join(['%s'] * len(skills))
        base_query += f''' AND s.user_id IN (
            SELECT ss2.student_id FROM student_skills ss2
            JOIN skills sk2 ON ss2.skill_id = sk2.id
            WHERE sk2.name IN ({skill_placeholders})
            GROUP BY ss2.student_id
            HAVING COUNT(DISTINCT sk2.name) = {len(skills)}
        )'''
        params.extend(skills)
    db_cursor.execute(base_query, params)
    student_list = db_cursor.fetchall()
    for student in student_list:
        db_cursor2 = db.get_db().cursor()
        db_cursor2.execute('''
            SELECT sk.name FROM student_skills ss
            JOIN skills sk ON ss.skill_id = sk.id
            WHERE ss.student_id = %s
        ''', (student['user_id'],))
        skill_list = [row['name'] for row in db_cursor2.fetchall()]
        student['skills'] = ', '.join(skill_list)

    response = make_response(jsonify(student_list))
    response.status_code = 200
    return response

# endpoint to view a student's resume
@employer_routes.route('/students/<int:student_id>/resume', methods=['GET'])
def get_student_resume(student_id):
    current_app.logger.info(f'GET /students/{student_id}/resume route')
    query = '''
        SELECT r.resume
        FROM resumes r
        WHERE r.student_id = %s
    '''
    db_cursor = db.get_db().cursor()
    db_cursor.execute(query, (student_id,))
    result = db_cursor.fetchall()
    resume_bytes = result[0]['resume']
    return send_file(
        io.BytesIO(resume_bytes),
        mimetype='application/pdf',
        as_attachment=True,
        download_name=f'resume_{student_id}.pdf'
    )

# endpoint to update a job posting
@employer_routes.route('/job-postings/<int:job_id>', methods=['PUT'])
def update_job_posting(job_id):
    current_app.logger.info(f'PUT /job-postings/{job_id} route')
    job_update = request.get_json()
    query = '''
        UPDATE job_postings
        SET title = %s, status = %s, flagged = %s
        WHERE id = %s
    '''
    db_cursor = db.get_db().cursor()
    db_cursor.execute(query, (job_update['title'], job_update['status'], job_update.get('flagged', False), job_id))
    db.get_db().commit()
    
    response = make_response(jsonify({'message': 'Job posting updated successfully'}))
    response.status_code = 200
    return response

# endpoint to mark a job as filled
@employer_routes.route('/job-postings/<int:job_id>/mark-filled', methods=['POST'])
def mark_job_as_filled(job_id):
    current_app.logger.info(f'POST /job-postings/{job_id}/mark-filled route')
    query = '''
        UPDATE job_postings
        SET status = 'filled'
        WHERE id = %s
    '''
    db_cursor = db.get_db().cursor()
    db_cursor.execute(query, (job_id,))
    db.get_db().commit()

    response = make_response(jsonify({'message': 'Job marked as filled'}))
    response.status_code = 200
    return response

# endpoint to approve or reject applications
@employer_routes.route('/applications/<int:application_id>/status', methods=['PUT'])
def update_application_status(application_id):
    current_app.logger.info(f'PUT /applications/{application_id}/status route')
    application_update = request.get_json()
    status = application_update.get('status')
    query = '''
        UPDATE applications
        SET status = %s
        WHERE id = %s
    '''
    db_cursor = db.get_db().cursor()
    db_cursor.execute(query, (status, application_id))
    db.get_db().commit()

    response = make_response(jsonify({'message': f'Application {status}'}))
    response.status_code = 200
    return response

# endpoint to get all applications for jobs posted by a given employer
@employer_routes.route('/applications', methods=['GET'])
def get_applications():
    current_app.logger.info('GET /applications route')
    employer_id = request.args.get('employer_id', type=int)
    db_cursor = db.get_db().cursor()
    application_query = '''
        SELECT a.id AS id, a.student_id, a.job_id, a.status AS status, a.date_applied,
               CONCAT(u.first_name, ' ', u.last_name) AS student_name, j.title AS job_title, j.employer_id
        FROM applications a
        JOIN students s ON a.student_id = s.user_id
        JOIN users u ON s.user_id = u.id
        JOIN job_postings j ON a.job_id = j.id
        WHERE j.employer_id = %s
    '''
    db_cursor.execute(application_query, (employer_id,))
    application_list = db_cursor.fetchall()

    response = make_response(jsonify(application_list))
    response.status_code = 200
    return response