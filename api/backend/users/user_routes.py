from flask import Blueprint, request, jsonify, make_response, current_app
from backend.db_connection import db

# Create a new Blueprint for user routes
user_routes = Blueprint('user_routes', __name__)

# ------------------------------------------------------------
# GET /api/users – Get all users
@user_routes.route('/users', methods=['GET'])
def get_users():
    current_app.logger.info('GET /users route')
    query = '''
        SELECT id, first_name, last_name, email, status, role
        FROM users
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    users = cursor.fetchall()

    the_response = make_response(jsonify(users))
    the_response.status_code = 200
    return the_response

# ------------------------------------------------------------
# POST /api/users – Add a new user
@user_routes.route('/users', methods=['POST'])
def add_user():
    current_app.logger.info('POST /users route')
    data = request.json
    query = '''
        INSERT INTO users (first_name, last_name, email, status, role)
        VALUES (%s, %s, %s, %s, %s)
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query, (data['first_name'], data['last_name'], data['email'], data['status'], data['role']))
    db.get_db().commit()

    the_response = make_response(jsonify({'message': 'User added successfully'}))
    the_response.status_code = 201
    return the_response

# ------------------------------------------------------------
# PUT /api/users/<id> – Update an existing user
@user_routes.route('/users/<int:id>', methods=['PUT'])
def update_user(id):
    current_app.logger.info(f'PUT /users/{id} route')
    data = request.json
    query = '''
        UPDATE users
        SET first_name = %s, last_name = %s, email = %s, status = %s, role = %s
        WHERE id = %s
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query, (data['first_name'], data['last_name'], data['email'], data['status'], data['role'], id))
    db.get_db().commit()    

    the_response = make_response(jsonify({'message': f'User {id} updated successfully'}))
    the_response.status_code = 200
    return the_response

# ------------------------------------------------------------
# DELETE /api/users/<id> – Delete a user
@user_routes.route('/users/<int:id>', methods=['DELETE'])
def delete_user(id):
    current_app.logger.info(f'DELETE /users/{id} route')
    query = '''
        DELETE FROM users
        WHERE id = %s
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query, (id,))
    db.get_db().commit()

    the_response = make_response(jsonify({'message': f'User {id} deleted successfully'}))
    the_response.status_code = 200
    return the_response

# ------------------------------------------------------------
# GET /api/users/summary – Get a breakdown of users by role
@user_routes.route('/users/summary', methods=['GET'])
def get_user_summary():
    current_app.logger.info('GET /users/summary route')
    query = '''
        SELECT role, COUNT(*) AS count
        FROM users
        GROUP BY role
    '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    summary = cursor.fetchall()

    the_response = make_response(jsonify(summary))
    the_response.status_code = 200
    return the_response

# ------------------------------------------------------------
# GET /api/users/inactive – Get all users inactive for 6 months or more
@user_routes.route('/users/inactive', methods=['GET'])
def get_users_inactive_by_activity():
    current_app.logger.info('GET /users/inactive route')

    query = '''
        SELECT u.id, u.first_name, u.last_name, u.email, u.status, u.role
        FROM users u
        LEFT JOIN applications a ON u.id = a.student_id
        LEFT JOIN issue_reports r ON u.id = r.user_id
        GROUP BY u.id
        HAVING 
            MAX(COALESCE(a.date_applied, '2000-01-01')) < NOW() - INTERVAL 6 MONTH
            AND MAX(COALESCE(r.date_created, '2000-01-01')) < NOW() - INTERVAL 6 MONTH
    '''

    cursor = db.get_db().cursor()
    cursor.execute(query)
    inactive_users = cursor.fetchall()

    the_response = make_response(jsonify(inactive_users))
    the_response.status_code = 200
    return the_response