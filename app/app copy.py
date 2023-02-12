from flask import Flask, make_response, redirect, url_for, render_template, request
from blueprints.affichage_statique.affichage_statique import affichage_statique
from blueprints.comptes.comptes import comptes 
from models import Personnage, Item, db 
from datetime import date
from sqlalchemy.sql import func

def creer_application():
    app_flask = Flask(__name__)
    app_flask.secret_key = "gb[>wZy.pR9*I*F"
    app_flask.register_blueprint(affichage_statique)
    app_flask.register_blueprint(comptes)
    #app_flask.config['SQLALCHEMY_DATABASE_URI']="mysql://root:rootpw@localhost:3306/biblio"
    app_flask.config['SQLALCHEMY_DATABASE_URI']="mysql://root:root@localhost:3307/travail2" #connexionàlabase
    app_flask.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False #pour eviter un bug sur ce qui est fait dans notre db
    return app_flask


app = creer_application()
db.init_app(app) #prendre lapplication flask et l'initialiser

@app.route("/")
def accueil():
    return "la page créer personnage : /personnages/creer."


@app.route("/personnages/creer") #c'est une route qui vas creer un personnage
def creer_personnage():
    personnage = Personnage(nom='Phil', niveau='1', date_creation=date.today()) #constructeur
    db.session.add(personnage) #il vas lire et ajouter
    db.session.commit() #si n ne fait pas de commito n ne verras psa nos donnee apparaitre
    return render_template('liste.html', personnages=Personnage.query.all()) #faire une requette pour avoir toute les personnage 


@app.route("/personnages/effacer") #c'est une route qui vas effacer un personnage
def creer_personnage_effacer():
    phil = Personnage.query.filter_by(nom='Phil').first() #on peu chercher par id aussi
    db.session.delete(phil)
    db.session.commit ()
    return "phil a été effacé"

@app.route("/personnages/<int:niveau>")
def changer_niveau(niveau) :
    phil = Personnage.query.filter_by(nom='Phil').first()
    phil.niveau += niveau
    db.session.commit()
    return f"phil a monté de {niveau} niveau(x). Nouveau niveau : {phil.niveau}"

@app.route("/items/<item>")
def ajout_item(item):
    phil = Personnage.query.filter_by(nom='Phil').first()
    item_cree = Item(nom=item, poids=12.2)
    phil.item.append(item_cree)

@app.route(" /poids")
def poids():
    resultat, = Item.query.with_entities(func.max(Item.poids).label("poids")).filter_by(personnage_id=8).first()
    return f"phil a maintenant {resultat} kg"

if __name__== "__main__":
    app.run(debug=True)