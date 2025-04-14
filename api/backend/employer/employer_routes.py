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