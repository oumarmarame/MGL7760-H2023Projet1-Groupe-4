# syntax=docker/dockerfile:1
FROM python:3.9
# LABEL maintainer oumarmarame@gmail.com
#WORKDIR /usr/src/app
WORKDIR /var/www/html
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
# #RUN pip install -U Flask-SQLAlchemy
EXPOSE 5000
COPY . .
CMD ["flask", "run"]