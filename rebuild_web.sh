#!/bin/bash
# Rebuild web script
# Use this script if you want to update your django code

docker-compose stop web
docker-compose rm web
docker rmi docker-compose-django_web
docker-compose up --build -d web
