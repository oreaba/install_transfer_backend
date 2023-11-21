#!/bin/bash
# read -p "step 6"

# running the project

cd /var/www/zakaa_backend/
source .venv/bin/activate
python manage.py makemigrations
python manage.py migrate
# python manage.py createsuperuser --email mhamdy@aucegypt.edu
# if you don’t want to enter password now:  
python manage.py createsuperuser --email mhamdy@aucegypt.edu --noinput

# creating static files for all the project so that they are served by nginx
python manage.py collectstatic
# 199 static files copied to '/var/www/zakaa_backend/static', 619 post-processed.

# python manage.py runserver

# from a new tab run 
#curl localhost:8000
# if all is ok press ctrl + c
