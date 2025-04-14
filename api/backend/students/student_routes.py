from flask import Blueprint
from flask import request
from flask import jsonify
from flask import make_response
from flask import current_app
from backend.db_connection import db
# Create blueprint for students routes 
students = Blueprint('students', __name__)

# Get all students from the system
@students.route('/students', methods=['GET'])
def get_students():

    cursor = db.get_db().cursor()
    cursor.execute('''SELECT user_id, major_id, grad_date, current_year, gpa, alumni
   FROM students 
    ''')
 theData = cursor.fetchall()
    
    the_response = make_response(jsonify(theData))
    the_response.status_code = 200
    return the_response


