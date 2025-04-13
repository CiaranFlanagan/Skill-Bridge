from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db

job_routes = Blueprint('job_routes', __name__)

@job_routes.route('/jobs', methods=['GET'])
def get_jobs():
    current_app.logger.info('GET /jobs route')
    status = request.args.get('status')
    flagged = request.args.get('flagged')

    query = '''
        SELECT id, employer_id, title, status, flagged, posted_date
        FROM job_postings
        WHERE (%s IS NULL OR status = %s)
          AND (%s IS NULL OR flagged = %s)
        ORDER BY posted_date DESC
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query, (status, status, flagged, flagged))
    jobs = cursor.fetchall()

    the_response = make_response(jsonify(jobs))
    the_response.status_code = 200
    return the_response


@job_routes.route('/jobs/<int:job_id>/flag', methods=['POST'])
def flag_job_posting(job_id):
    current_app.logger.info(f'POST /jobs/{job_id}/flag route')

    query = '''
        UPDATE job_postings
        SET flagged = TRUE
        WHERE id = %s
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query, (job_id,))
    db.get_db().commit()

    the_response = make_response(jsonify({'message': f'Job posting {job_id} has been flagged.'}))
    the_response.status_code = 200
    return the_response

@job_routes.route('/jobs/<int:job_id>', methods=['DELETE'])
def delete_job_posting(job_id):
    current_app.logger.info(f'DELETE /jobs/{job_id} route')

    query = '''
        DELETE FROM job_postings
        WHERE id = %s
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query, (job_id,))
    db.get_db().commit()

    the_response = make_response(jsonify({'message': f'Job posting {job_id} has been deleted.'}))
    the_response.status_code = 200
    return the_response