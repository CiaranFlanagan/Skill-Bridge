from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db

job_routes = Blueprint('job_routes', __name__)

@job_routes.route('/job_postings', methods=['GET'])
def get_all_job_postings():
    current_app.logger.info("GET /job_postings")
    query = '''
        SELECT jp.id, jp.title, jp.status, jp.flagged, jp.posted_date,
               u.first_name, u.last_name, u.email, e.company_name
        FROM job_postings jp
        JOIN employers e ON jp.employer_id = e.user_id
        JOIN users u ON e.user_id = u.id
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    data = cursor.fetchall()
    return make_response(jsonify(data), 200)

@job_routes.route('/job_postings/<int:job_id>', methods=['PUT'])
def update_job_posting(job_id):
    current_app.logger.info(f"PUT /job_postings/{job_id}")
    data = request.json
    status = data.get('status')
    flagged = data.get('flagged')

    update_parts = []
    values = []

    if status is not None:
        update_parts.append("status = %s")
        values.append(status)
    if flagged is not None:
        update_parts.append("flagged = %s")
        values.append(flagged)

    if not update_parts:
        return make_response(jsonify({"error": "No fields provided"}), 400)

    values.append(job_id)
    query = f"UPDATE job_postings SET {', '.join(update_parts)} WHERE id = %s"

    cursor = db.get_db().cursor()
    cursor.execute(query, values)
    db.get_db().commit()
    return make_response(jsonify({"message": "Job posting updated"}), 200)

@job_routes.route('/job_postings/<int:job_id>', methods=['DELETE'])
def delete_job_posting(job_id):
    current_app.logger.info(f"DELETE /job_postings/{job_id}")
    query = "DELETE FROM job_postings WHERE id = %s"
    cursor = db.get_db().cursor()
    cursor.execute(query, (job_id,))
    db.get_db().commit()
    return make_response(jsonify({"message": "Job posting deleted"}), 200)
