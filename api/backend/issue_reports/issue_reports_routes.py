from flask import Blueprint, request, jsonify, make_response, current_app
from backend.db_connection import db

issue_routes = Blueprint('issue_routes', __name__)

# -----------------------------------------------
# GET /api/issue_reports – Get all issue reports
@issue_routes.route('/issue_reports', methods=['GET'])
def get_issue_reports():
    current_app.logger.info("GET /issue_reports")

    query = '''
        SELECT r.id, r.date_created, r.type, r.status, r.description,
               u.first_name, u.last_name, u.email
        FROM issue_reports r
        JOIN users u ON r.user_id = u.id
        ORDER BY r.date_created DESC
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    reports = cursor.fetchall()

    return make_response(jsonify(reports), 200)