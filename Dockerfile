# FROM python:3.11.2
#FROM tiangolo/uwsgi-nginx-flask:python3.11
# ENV CONTAINER_HOME=/var/www
# WORKDIR $CONTAINER_HOME
# ADD . $CONTAINER_HOME
FROM python:3.9
WORKDIR /var/www/html
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
EXPOSE 5000
CMD ["flask", "run"]