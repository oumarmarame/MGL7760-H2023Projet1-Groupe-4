import datetime
from flask import Flask, render_template

app = Flask(__name__)


@app.route('/')
def hello():
    return render_template('index.html', utc_dt=datetime.datetime.utcnow())

@app.route('/about/')
def about():
    return render_template('about.html')

@app.route('/comments/')
def comments():
    comments = ['This is the first comment.',
                'This is the second comment.',
                'This is the third comment.',
                'This is the fourth comment.'
                ]

    return render_template('comments.html', comments=comments)

# from flask import Flask
# api = Flask(__name__)

# @api.route("/")
# def hello():
#     return "Hello World from Flask"

if __name == '__main__':
    app.run(host='0.0.0.0', port=9090)
    #app.run(debug=True, host='0.0.0.0')
    #app.run(host='0.0.0.0', port=8000)
    #app.run(debug=True, host='0.0.0.0', port=8000)
