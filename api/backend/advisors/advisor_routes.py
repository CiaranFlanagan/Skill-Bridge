from flask import Blueprint, request, jsonify, make_response, current_app
from backend.db_connection import db

# Create a new BLbueprint for advisor routes
advisor_routes = Blueprint('advisor_routes', __name__)

# GET /api/students - Get all students
@advisor_routes.route('/students', methods=['GET'])
def get_students():
    current_app.logger.info('GET /students route')
    query = '''
            SELECT u.id AS user_id,
            u.first_name,   
            u.last_name,
            m.name AS major_name,
            m.id AS major_id,
            s.grad_date, 
            s.current_year, 
            s.gpa, 
            s.alumni,
            COUNT(a.id) AS application_count
            FROM students s
            JOIN users u ON s.user_id = u.id
            JOIN majors m ON m.id = s.major_id
            JOIN applications a ON a.student_id = s.user_id
            GROUP BY user_id
            '''
    
    cursor = db.get_db().cursor()
    cursor.execute(query)
    students = cursor.fetchall()

    response = make_response(jsonify(students))
    response.status_code = 200
    return response

# DELETE /api/students/<id> - Delete a Student
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

# GET /advisor/alumni/<major_id> - Get alumni matched by student major
@advisor_routes.route('/advisor/alumni/<int:major_id>', methods=['GET'])
def get_alumni_by_major(major_id):
    current_app.logger.info(f'GET /advisor/alumni/{major_id} route')
    query = '''
    SELECT u.first_name, u.last_name, m.name AS major_name, s.grad_date
    FROM   students s
    JOIN   users u ON s.user_id = u.id
    JOIN   majors m ON m.id = s.major_id
    WHERE  s.alumni = TRUE AND s.major_id = %s
    '''

    cursor = db.get_db().cursor()
    cursor.execute(query, (major_id,))
    alumni = cursor.fetchall()

    response = make_response(jsonify(alumni))
    response.status_code = 200
    return response

# GET /advisor/hire_frequency = Get frequency of hires by company
@advisor_routes.route('/advisor/hire-frequency', methods=['GET'])
def get_hire_frequency():
    current_app.logger.info('GET /advisor/hire-frequency route')
    query = '''
            SELECT e.company_name, 
                   COUNT(*) AS hire_count
            FROM   applications a
            JOIN   job_postings jp ON jp.id = a.job_id
            JOIN   employers e ON e.user_id = jp.employer_id
            GROUP BY e.company_name
            ORDER BY hire_count DESC
            '''
    
    cursor = db.get_db().cursor()
    cursor.execute(query)
    rows = cursor.fetchall()
    response = make_response(jsonify(rows))
    return response


# GET /advisor/student_resume/<int:id> - Get student resume info
@advisor_routes.route('advisor/student-resume/<int:id>', methods=['GET'])
def get_student_resume(id):
    current_app.logger.info(f'GET /advisor/student-resume/{id} route')
    query = '''
            SELECT r.file_name, rf.upload_date, r.resume
            FROM   resumes r
            JOIN   resume_feedback rf ON r.id = rf.resume_id
            JOIN   students s ON r.id = s.user_id
            WHERE  s.user_id = %s
            '''
    cursor = db.get_db().cursor()
    cursor.execute(query, (id,))
    resume = cursor.fetchone()

    response  = make_response(jsonify(resume))
    response.status_code = 200
    return response

# POST /advisor/feedback - Add advisor suggestions or corrections to resume
@advisor_routes.route('/advisor/feedback', methods=['POST'])
def add_feedback():
    current_app.logger.info('POST /advisor/feedback route')
    data = request.get_json()

    query = '''
            INSERT INTO resume_feedback (advisor_id, resume_id, upload_date, score, feedback)
            VALUES (%s, %s, %s, %s, %s)
            '''    
    
    cursor = db.get_db().cursor()
    cursor.execute(query, (
        data['advisor_id'],
        data['resume_id'],
        data['upload_date'],
        data['score'],
        data['feedback']
    ))
    db.get_db().commit()

    response = make_response(jsonify({'Message': 'Feedback Submitted Successfully'}))
    response.status_code = 201 # Created
    return response
    
# All Advisors
@advisor_routes.route('/advisor/all', methods=['GET'])
def get_all_advisors():
    cursor = db.get_db().cursor()
    query = '''SELECT id, 
                      first_name, 
                      last_name 
               FROM   users
               WHERE  role = 'advisor' 
            '''
    cursor.execute(query)
    rows = cursor.fetchall()
    response = make_response(jsonify(rows))
    return response

# ALL RESUMES
@advisor_routes.route('/resumes/all', methods=['GET'])
def get_all_resumes():
    cursor = db.get_db().cursor()
    query = '''
            SELECT r.id,
            u.first_name,
            u.last_name        
            FROM resumes r
            JOIN students s ON r.student_id = s.user_id
            JOIN users u ON s.user_id = u.id
            '''
    cursor.execute(query)
    rows = cursor.fetchall()
    response = make_response(jsonify(rows))
    return response

# GET /advisor/top-skills = Get top skills from all job postings
@advisor_routes.route('/advisor/top-skills', methods=['GET'])
def get_top_skills():
    current_app.logger.info('GET /advisor/top-skills route')
    query = '''
            SELECT s.name, COUNT(*) AS frequency
            FROM   job_postings jp
            JOIN   job_posting_skills jps ON jp.id = jps.job_id
            JOIN   skills s ON s.id = jps.skill_id
            GROUP  BY s.name
            ORDER  BY frequency DESC
            LIMIT  10
            '''
    cursor = db.get_db().cursor()
    cursor.execute(query)
    skills = cursor.fetchall()

    response = make_response(jsonify(skills))
    response.status_code = 200
    return response
