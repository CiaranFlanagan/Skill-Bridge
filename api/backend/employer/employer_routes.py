from flask import Blueprint, request, jsonify, make_response, current_app
from backend.db_connection import db

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

@employer_routes.route('/resumes/<int:student_id>', methods=['GET'])
def get_student_resume(student_id):
    current_app.logger.info(f'GET /resumes/{student_id} route')
    query = '''
        SELECT r.id AS resume_id, r.resume, u.first_name, u.last_name
        FROM resumes r
        JOIN students s ON r.student_id = s.user_id
        JOIN users u ON s.user_id = u.id
        WHERE r.student_id = %s
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query, (student_id,))
    resume = cursor.fetchone()

    if resume:
        response = make_response(jsonify(resume))
        response.status_code = 200
    else:
        response = make_response(jsonify({'error': 'Resume not found'}))
        response.status_code = 404
    return response

