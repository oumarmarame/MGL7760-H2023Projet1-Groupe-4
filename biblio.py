#import os
from flask import Flask, render_template, flash, request, redirect, url_for
#from forms import LoginForm
from flask_sqlalchemy import SQLAlchemy
#flask.ext - import extensions directly by their name instead of through the flask.ext namespace. 
# For example, import flask.ext.sqlalchemy becomes import flask_sqlalchemy.
#create the object of Flask
app = Flask(__name__)
#SqlAlchemy Database Configuration With Mysql
#app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql:///biblio.db'
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:''@localhost/flaskcodeloop'
db = SQLAlchemy(app)
db.init_app(app)

class Auteur(db.Model):
    id_auteur = db.Column(db.Integer, primary_key=True)
    nom_auteur = db.Column(db.String(30), nullable=False)

    def __init__(self, nom_auteur):
        self.nom_auteur = nom_auteur

    def __repr__(self):
        return f'<Auteur "{self.nom}">'
class AuteurLivre(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    id_auteur = db.Column(db.Integer, db.ForeignKey('auteur.id_auteur'))
    

class Categorie(db.Model):
    id_categorie = db.Column(db.Integer, primary_key=True)
    code_categorie = db.Column(db.String(15), nullable=False)
    nom_categorie = db.Column(db.String(30), nullable=False)

    def __init__(self, code_categorie, nom_categorie):
        self.code_categorie = code_categorie_auteur
        self.nom_categorie = nom_categorie_auteur

    def __repr__(self):
        return f'<Categorie "{self.nom}">'

class CategorieLivre(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    id_categorie = db.Column(db.Integer, db.ForeignKey('categorie.id_categorie'))

class Editeur(db.Model):
    id_editeur = db.Column(db.Integer, primary_key=True)
    nom_editeur = db.Column(db.String(30), nullable=False)

    def __init__(self, nom_editeur):
        self.nom_editeur = nom_editeur

    def __repr__(self):
        return f'<Editeur "{self.nom}">'

class Livre(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    titre = db.Column(db.String(30), nullable=False)
    description = db.Column(db.String(100), nullable=False)
    annee_apparition = db.Column(db.Date, nullable=False)
    image = db.Column(db.String(100), nullable=False)
    categorie = db.Column(db.String(15), nullable=False)
    date_creation = db.Column(db.Date, nullable=False)
    date_modification = db.Column(db.Date, nullable=False)
    id_editeur = db.Column(db.Integer, db.ForeignKey('editeur.id_editeur'))
    
    def __init__(self, titre, description, annee_apparition, image, categorie, date_creation, date_modification, id_editeur):
        self.titre = titre
        self.description = description
        self.annee_apparition = annee_apparition
        self.image = image
        self.categorie = categorie
        self.date_creation = date_creation
        self.date_modification = date_modification
        self.id_editeur = id_editeur

    def __repr__(self):
        return f'<Livre "{self.titre}">'

if __name__ == '__main__':
    db.create_all()
