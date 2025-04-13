from flask import Blueprint, request, jsonify, make_response, current_app
from backend.db_connection import db

# Create a new Blueprint for advisor routes
advisor_routes = Blueprint('advisor_routes', __name__)

# -----------------------------
# GET /advisor - Get all students
# -----------------------------
@advisor_routes.route('/advisor', methods=['GET'])
def get_students():
    current_app.logger.info('GET /advisor route')
    query = '''
            SELECT user_id, major_id, grad_date, current_year, gpa, alumni
            FROM students
            '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    students = cursor.fetchall()

    response = make_response(jsonify(students))
    response.status_code = 200
    return response

# ---------------------------------------
# DELETE /students/<id> - Delete a student
# ---------------------------------------
@advisor_routes.route('/students/<int:id>', methods=['DELETE'])
def delete_student(id):
    current_app.logger.info(f'DELETE /students/{id} route')
    query = '''
            DELETE FROM students
            WHERE id = %s
            '''
    cursor = db.get_db().cursor()
    cursor.execute(query, (id,))
    db.get_db().commit()

    response = make_response(jsonify({'message': f'Student {id} deleted successfully'}))
    response.status_code = 200
    return response

# ----------------------------------------------------------------------
# GET /advisor/alumni/<major_id> - Get alumni matched by student major
# ----------------------------------------------------------------------
@advisor_routes.route('/advisor/alumni/<int:major_id>', methods=['GET'])
def get_alumni_by_major(major_id):
    current_app.logger.info(f'GET /advisor/alumni/{major_id} route')
    query = '''
            SELECT u.first_name, u.last_name, s.grad_date, s.gpa
            FROM students s
            JOIN users u ON s.user_id = u.id
            WHERE s.major_id = %s AND s.alumni = TRUE
            '''
    cursor = db.get_db().cursor()
    cursor.execute(query, (major_id,))
    alumni = cursor.fetchall()

    response = make_response(jsonify(alumni))
    response.status_code = 200
    return response

# ------------------------------------------------------------
# GET /advisor/hire-frequency - Get frequency of hires by company
# ------------------------------------------------------------
@advisor_routes.route('/advisor/hire-frequency', methods=['GET'])
def get_hire_frequency():
    current_app.logger.info('GET /advisor/hire-frequency route')
    query = '''
            SELECT e.company_name, COUNT(*) AS hire_count
            FROM job_applications ja
            JOIN job_posting jp ON ja.job_posting_id = jp.id
            JOIN employer e ON jp.employer_id = e.id
            GROUP BY e.company_name
            ORDER BY hire_count DESC
            '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    freq = cursor.fetchall()

    response = make_response(jsonify(freq))
    response.status_code = 200
    return response

# -----------------------------------------------------------------
# GET /advisor/student-resume/<student_id> - Get student resume info
# -----------------------------------------------------------------
@advisor_routes.route('/advisor/student-resume/<int:student_id>', methods=['GET'])
def get_student_resume(student_id):
    current_app.logger.info(f'GET /advisor/student-resume/{student_id} route')
    query = '''
            SELECT r.file_name, r.uploaded_at, r.file_blob
            FROM resumes r
            JOIN students s ON r.id = s.resume_id
            WHERE s.id = %s
            '''
    cursor = db.get_db().cursor()
    cursor.execute(query, (student_id,))
    resume = cursor.fetchone()

    response = make_response(jsonify(resume))
    response.status_code = 200
    return response

# ------------------------------------------------------------------------
# POST /advisor/feedback - Add advisor suggestions or corrections to resume
# ------------------------------------------------------------------------
@advisor_routes.route('/advisor/feedback', methods=['POST'])
def add_feedback():
    current_app.logger.info('POST /advisor/feedback route')
    data = request.get_json()

    query = '''
            INSERT INTO advisor_feedback (student_id, resume_id, advisor_id, suggestion_text)
            VALUES (%s, %s, %s, %s)
            '''
    cursor = db.get_db().cursor()
    cursor.execute(query, (
        data['student_id'],
        data['resume_id'],
        data['advisor_id'],
        data['suggestion_text']
    ))
    db.get_db().commit()

    response = make_response(jsonify({'message': 'Feedback submitted successfully'}))
    response.status_code = 201
    return response

# ---------------------------------------------------------------
# GET /advisor/top-skills - Get top skills from all job postings
# ---------------------------------------------------------------
@advisor_routes.route('/advisor/top-skills', methods=['GET'])
def get_top_skills():
    current_app.logger.info('GET /advisor/top-skills route')
    query = '''
            SELECT skill, COUNT(*) AS frequency
            FROM job_posting_skills
            GROUP BY skill
            ORDER BY frequency DESC
            LIMIT 10
            '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    skills = cursor.fetchall()

    response = make_response(jsonify(skills))
    response.status_code = 200
    return response
