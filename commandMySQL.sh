#Se connecter en root | Utiliser le mot de passe déclarer sur docker-compose
mysql -u root -p

#Afficher les utilisateurs et leurs host
SELECT user, host FROM mysql.user;

#Afficher l'utilisateur actuel
SELECT USER(),CURRENT_USER();

#Afficher les bases de données :
SHOW DATABASES;

#Afficher la base de donnée “biblio” :
SHOW DATABASES LIKE “biblio”;

#Savoir quelle base de données est actuellement sélectionnée:
SELECT DATABASE();

#Afficher les tables de la base de donné sélectionée :
SHOW TABLES;

#Afficher toute les tables :
SHOW FULL TABLES;

#Afficher le contenu de la table
SELECT * FROM nom_Table;
