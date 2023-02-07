# FROM node 
# LABEL maintainer ian.miell@gmail.com
# RUN git clone -q https://github.com/docker-in-practice/todo.git 
# WORKDIR todo
# RUN npm install > /dev/null 
# EXPOSE 8000
# CMD ["npm","start"]

#Pour le serveur applicatif
# installer les dépendances nécessaires pour l'application et copiera votre code.

# # # FROM python:3.10.9
# # # ADD . /code
# # # WORKDIR /code
# # # RUN pip install -r requirements.txt
# # # CMD python app.py

# syntax=docker/dockerfile:1
FROM python:3.7-alpine
WORKDIR /code
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
RUN apk add --no-cache gcc musl-dev linux-headers
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
EXPOSE 5000
COPY . .
CMD ["flask", "run"]

#FROM python:3.7-alpine
#WORKDIR /code
#ENV FLASK_APP=www/app.py
#ENV FLASK_RUN_HOST=0.0.0.0
#RUN apk add --no-cache gcc musl-dev linux-headers
#COPY requirements.txt requirements.txt
#RUN pip install -r requirements.txt
#EXPOSE 5000
#COPY . .
#CMD ["flask","run"]