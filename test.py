from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:rootpw@db:3306/biblio'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)
# db.init_app(app)
class User (db.Model) :
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String (80), unique=True, nullable=False)
    email = db.Column(db.String (120), unique=True, nullable=False)

# if __name__ == '__main__':
#     db.create_all()
    
@app. route ('/test_connection')
def test_connection():
    try:
        db.create_all()
        return "Connection to database is successful" 
    except Exception as e:
        return "Error while connecting to the database: " + str(e)