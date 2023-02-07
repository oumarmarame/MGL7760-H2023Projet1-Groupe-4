from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///biblio.db'
db = SQLAlchemy(app)

class Auteur(db.Model):
    id_auteur = db.Column(db.Integer, primary_key=True)
    nom_auteur = db.Column(db.String(30), nullable=False)

class AuteurLivre(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    id_auteur = db.Column(db.Integer, db.ForeignKey('auteur.id_auteur'))

class Categorie(db.Model):
    id_categorie = db.Column(db.Integer, primary_key=True)
    code_categorie = db.Column(db.String(15), nullable=False)
    nom_categorie = db.Column(db.String(30), nullable=False)

class CategorieLivre(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    id_categorie = db.Column(db.Integer, db.ForeignKey('categorie.id_categorie'))

class Editeur(db.Model):
    id_editeur = db.Column(db.Integer, primary_key=True)
    nom_editeur = db.Column(db.String(30), nullable=False)

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

if __name__ == '__main__':
    db.create_all()
