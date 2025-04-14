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


####
# PUT /api/issue_reports/<id> – Update report status
@issue_routes.route('/issue_reports/<int:id>', methods=['PUT'])
def update_issue_status(id):
    current_app.logger.info(f"PUT /issue_reports/{id}")
    data = request.json
    new_status = data.get('status')

    if not new_status:
        return make_response(jsonify({'error': 'Status is required'}), 400)

    query = '''
        UPDATE issue_reports
        SET status = %s
        WHERE id = %s
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query, (new_status, id))
    db.get_db().commit()

    return make_response(jsonify({'message': 'Status updated'}), 200)