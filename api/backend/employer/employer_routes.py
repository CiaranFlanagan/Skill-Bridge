from flask import Blueprint, request, jsonify, make_response, current_app, send_file
from backend.db_connection import db
import io

# make new blueprint for employer routes
employer_routes = Blueprint('employer_routes', __name__)

# endpoint for when a recruiter posts a new job
@employer_routes.route('/job-postings', methods=['POST'])
def create_job_posting():
    current_app.logger.info('POST /job-postings route')
    data = request.get_json()

    query = '''
        INSERT INTO job_postings (employer_id, title, status, posted_date)
        VALUES (%s, %s, %s, NOW())
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query, (data['employer_id'], data['title'], data['status']))
    db.get_db().commit()

    response = make_response(jsonify({'message': 'Job posted successfully'}))
    response.status_code = 201
    return response

# endpoint for filtering students by major, skillset, and GPA
@employer_routes.route('/filter-students', methods=['GET'])
def filter_students():
    current_app.logger.info('GET /filter-students route')

    major = request.args.get('major')
    gpa = request.args.get('gpa', type=float)
    skills = request.args.getlist('skill')

    if not (major and gpa and skills):
        return make_response(jsonify({'error': 'Missing major, gpa, or skills'}), 400)

    placeholders = ', '.join(['%s'] * len(skills))
    query = f'''
        SELECT s.user_id, u.first_name, u.last_name, m.name AS major, s.gpa,
               GROUP_CONCAT(sk.name) AS skills
        FROM students s
        JOIN users u ON s.user_id = u.id
        JOIN majors m ON s.major_id = m.id
        JOIN student_skills ss ON s.user_id = ss.student_id
        JOIN skills sk ON ss.skill_id = sk.id
        WHERE s.gpa >= %s AND m.name = %s AND sk.name IN ({placeholders})
        GROUP BY s.user_id, u.first_name, u.last_name, m.name, s.gpa
    '''

    cursor = db.get_db().cursor()
    params = [gpa, major] + skills
    cursor.execute(query, params)
    students = cursor.fetchall()

    return jsonify(students)

# endpoint to view a student's resume
@employer_routes.route('/students/<int:student_id>/resume', methods=['GET'])
def get_student_resume(student_id):
    current_app.logger.info(f'GET /students/{student_id}/resume route')
    query = '''
        SELECT r.resume
        FROM resumes r
        WHERE r.student_id = %s
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query, (student_id,))
    result = cursor.fetchone()
    if not result:
        return make_response(jsonify({'error': 'Resume not found'}), 404)
    resume_bytes = result['resume']
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
    data = request.get_json()
    query = '''
        UPDATE job_postings
        SET title = %s, status = %s, flagged = %s
        WHERE id = %s
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query, (data['title'], data['status'], data.get('flagged', False), job_id))
    db.get_db().commit()
    return jsonify({'message': 'Job posting updated successfully'})

# endpoint to mark a job as filled
@employer_routes.route('/job-postings/<int:job_id>/mark-filled', methods=['POST'])
def mark_job_as_filled(job_id):
    current_app.logger.info(f'POST /job-postings/{job_id}/mark-filled route')
    query = '''
        UPDATE job_postings
        SET status = 'filled'
        WHERE id = %s
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query, (job_id,))
    db.get_db().commit()
    return jsonify({'message': 'Job marked as filled'})

# endpoint to approve or reject applications
@employer_routes.route('/applications/<int:application_id>/status', methods=['PUT'])
def update_application_status(application_id):
    current_app.logger.info(f'PUT /applications/{application_id}/status route')
    data = request.get_json()
    status = data.get('status')
    if status not in ['approved', 'rejected']:
        return make_response(jsonify({'error': 'Invalid status'}), 400)
    query = '''
        UPDATE applications
        SET status = %s
        WHERE id = %s
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query, (status, application_id))
    db.get_db().commit()
    return jsonify({'message': f'Application {status}'})