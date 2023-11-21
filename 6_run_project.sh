#!/bin/bash
# read -p "step 6"

# running the project
echo "6.1 Activating the virtual environment ..."
cd /var/www/zakaa_backend/
source .venv/bin/activate

echo "6.2 Applying Database Migrations ..."
python manage.py makemigrations
python manage.py migrate
# python manage.py createsuperuser --email mhamdy@aucegypt.edu
# if you don’t want to enter password now:  

echo "6.3 Creating Superuser ..."
python manage.py createsuperuser --email mhamdy@aucegypt.edu --noinput

echo "6.4 Generating Project Static Assets ..."
# creating static files for all the project so that they are served by nginx
python manage.py collectstatic
# 199 static files copied to '/var/www/zakaa_backend/static', 619 post-processed.

# python manage.py runserver

# from a new tab run 
#curl localhost:8000
# if all is ok press ctrl + c
