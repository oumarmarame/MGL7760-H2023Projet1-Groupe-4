#!/bin/bash

# Variables pour les noms des conteneurs et images
web_container="web"
app_container="app"
db_container="db"
cache_container="cache"
image_name="biblio_app"

# Créer l'environnement de développement
function create_environment() {
  # Lancer tous les conteneurs avec Docker Compose
  docker-compose up -d
}

# Importer de nouveaux livres dans la base de données
function import_books() {
  # Importer les livres à partir d'un fichier CSV
  docker exec -it $db_container bash -c "command for importing books from csv"

  # Vérifier que les livres ont été correctement importés
  docker exec -it $db_container bash -c "command to check if books were imported"
}

# Supprimer l'environnement de développement
function delete_environment() {
  # Arrêter et supprimer les conteneurs avec Docker Compose
  docker-compose down --volumes
  #docker-compose down -v
}

# Démarrer les conteneurs
function start_containers() {
  # Démarrer les conteneurs existants avec Docker Compose
  docker-compose start
}

# Arrêter les conteneurs
function stop_containers() {
  # Arrêter les conteneurs existants avec Docker Compose
  docker-compose stop
}

# Analyse des options
case $1 in
  "create") create_environment;;
  "import") import_books;;
  "delete") delete_environment;;
  "start") start_containers;;
  "stop") stop_containers;;
  *) echo "Usage: gerer-conteneurs.sh [create|import|delete|start|stop]"
esac
#if [ "$1" == "create" ]; then
#create_env
#elif [ "$1" == "import" ]; then
#import_books
#elif [ "$1" == "remove" ]; then
#remove_env
#elif [ "$1" == "start" ]; then
#start_containers
#elif [ "$1" == "stop" ]; then
#stop_containers
#else
#echo "Usage : gerer-conteneurs.sh {create|import|remove|start|stop}"
#fi