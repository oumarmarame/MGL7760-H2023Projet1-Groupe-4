# syntax=docker/dockerfile:1
FROM python:3.11.2
#FROM tiangolo/uwsgi-nginx-flask:python3.11
# LABEL maintainer oumarmarame@gmail.com
#WORKDIR /usr/src/app
WORKDIR /var/www/MGL7760-H2023Projet1-Groupe-4/app
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
#COPY requirements.txt requirements.txt
COPY ./requirements.txt /app/requirements.txt
#RUN pip install -r requirements.txt
RUN pip install --upgrade -r /app/requirements.txt
RUN pip install -U Flask-SQLAlchemy
EXPOSE 5000
#COPY . .
COPY ./app /app
CMD ["flask", "run"]