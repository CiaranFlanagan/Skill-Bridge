from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db
import datetime
# Create blueprint for students routes 
students = Blueprint('students', __name__)

# # Get all students from the system
# @students.route('/students', methods=['GET'])
# def get_students():

#     cursor = db.get_db().cursor()
#     cursor.execute('''SELECT user_id, major_id, grad_date, current_year, gpa, alumni
#    FROM students 
#     ''')
#     theData = cursor.fetchall()

#     the_response = make_response(jsonify(theData))
#     the_response.status_code = 200
#     return the_response

# # Update student info 
# @students.route('/students', methods=['PUT'])
# def update_student():
#     student_info = request.json
#     s.user_id = student_info
#     major_id = student_info['major_id']
#     grad_date = student_info['grad_date']
#     current_year = student_info['current_year']
#     gpa = student_info['gpa']
#     alumni = student_info['alumni']
#     query = '''UPDATE students SET major_id = %s, grad_date = %s, current_year = %s, gpa = %s, alumni = %s
#     WHERE user_id = %s'''
#     data = (major_id, grad_date, current_year, gpa, alumni, user_id)
#     cursor = db.get_db().cursor()
#     r = cursor.execute(query, data)
#     db.get_db().commit()
#     return 'student updated!'

#     # Get job recommendations 
#     @students.route('/students/recommended_jobs', methods=['GET'])
#     def get_recommended_jobs(student_id):
#         cursor = db.get_db().cursor()

#         cursor.execute (''' SELECT DISTINCT p.id, jp.title, jp.posted_date, e.company_name 
#         FROM student_skills ss 
#         JOIN job_posting_skills jps ON ss.skill_id = jps.skill_id
#         JOIN job_postings jp ON jps.job_id = jp.id
#         JOIN employers e ON jp.employer_id = e.user_id
#         WHERE ss.student_id = %s
#         AND jp.status = 'active'
#         ORDER BY jp.posted_date DESC
#         LIMIT 10
#         ''')
#         cursor.execute(query, (student_id,))
#         jobs = cursor.fetchall()
#         return make_response(jsonify(jobs), 200)


@students.route('/students/top-skills', methods=['GET'])
def get_top_skills():
    current_app.logger.info('GET /students/top-skills route')
    query = '''
        SELECT s.name AS skill, COUNT(ss.student_id) AS count
        FROM student_skills ss
        JOIN skills s ON ss.skill_id = s.id
        GROUP BY s.name
        ORDER BY count DESC
        LIMIT 10
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    top_skills = cursor.fetchall()
    
    response = make_response(jsonify(top_skills))
    response.status_code = 200
    return response

@students.route('/students/<int:student_id>/recommended-jobs', methods=['GET'])
def get_recommended_jobs(student_id):
    current_app.logger.info(f'GET /students/{student_id}/recommended-jobs route')

    query = '''
        SELECT DISTINCT jp.id, jp.title, jp.status, jp.flagged, jp.posted_date,
               e.company_name
        FROM job_postings jp
        JOIN job_posting_skills jps ON jp.id = jps.job_id
        JOIN student_skills ss ON jps.skill_id = ss.skill_id
        JOIN students s ON ss.student_id = s.user_id
        JOIN employers e ON jp.employer_id = e.user_id
        WHERE s.user_id = %s
          AND jp.status = 'active'
          AND jp.flagged = FALSE
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query, (student_id,))
    recommended_jobs = cursor.fetchall()

    response = make_response(jsonify(recommended_jobs))
    response.status_code = 200
    return response

@students.route('/students/new-jobs', methods=['GET'])
def get_new_jobs():
    current_app.logger.info('GET /students/new-jobs route')

    query = '''
        SELECT jp.id, jp.title, jp.status, jp.flagged, jp.posted_date,
               e.company_name
        FROM job_postings jp
        JOIN employers e ON jp.employer_id = e.user_id
        WHERE jp.status = 'active'
          AND jp.flagged = FALSE
          AND jp.posted_date >= NOW() - INTERVAL 7 DAY
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    new_jobs = cursor.fetchall()

    response = make_response(jsonify(new_jobs))
    response.status_code = 200
    return response


#----####----- resume route (please work)
@students.route('/students/<int:student_id>/advisor', methods=['GET'])
def get_student_advisor(student_id):
    current_app.logger.info(f'GET /students/{student_id}/advisor')
    query = '''
        SELECT u.first_name, u.last_name, u.email
        FROM advisor_students a_s
        JOIN advisors a ON a_s.advisor_id = a.user_id
        JOIN users u ON a.user_id = u.id
        WHERE a_s.student_id = %s
        LIMIT 1
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query, (student_id,))
    advisor = cursor.fetchone()

    if advisor:
        return make_response(jsonify(advisor), 200)
    else:
        return make_response(jsonify({'error': 'Advisor not found'}), 404)
    
@students.route('/students/<int:student_id>/resume_feedback', methods=['GET'])
def get_resume_feedback(student_id):
    current_app.logger.info(f'GET /students/{student_id}/resume_feedback')
    query = '''
        SELECT rf.score, rf.feedback, rf.upload_date
        FROM resumes r
        JOIN resume_feedback rf ON r.id = rf.resume_id
        WHERE r.student_id = %s
        ORDER BY rf.upload_date DESC
        LIMIT 1
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query, (student_id,))
    feedback = cursor.fetchone()

    if feedback:
        return make_response(jsonify(feedback), 200)
    else:
        return make_response(jsonify({'error': 'No feedback found'}), 404)
    
@students.route('/students/<int:student_id>/apply/<int:job_id>', methods=['POST'])
def apply_to_job(student_id, job_id):
    current_app.logger.info(f"POST /students/{student_id}/apply/{job_id}")

    try:
        cursor = db.get_db().cursor()

        query = '''
            INSERT INTO applications (student_id, job_id, date_applied, status)
            VALUES (%s, %s, %s, %s)
        '''
        today = datetime.date.today()

        cursor.execute(query, (student_id, job_id, today, 'pending'))
        db.get_db().commit()

        return make_response(jsonify({"message": "Application submitted successfully!"}), 201)

    except Exception as e:
        current_app.logger.error(f"Error applying to job: {e}")
        return make_response(jsonify({"error": str(e)}), 500)
    
    
@students.route('/students/<int:student_id>/applications', methods=['GET'])
def get_student_applications(student_id):
    current_app.logger.info(f'GET /students/{student_id}/applications route')

    query = '''
        SELECT a.id AS application_id,
               jp.title AS job_title,
               e.company_name,
               a.date_applied,
               a.status
        FROM applications a
        JOIN job_postings jp ON a.job_id = jp.id
        JOIN employers e ON jp.employer_id = e.user_id
        WHERE a.student_id = %s
        ORDER BY a.date_applied DESC
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query, (student_id,))
    applications = cursor.fetchall()

    response = make_response(jsonify(applications))
    response.status_code = 200
    return response


    


