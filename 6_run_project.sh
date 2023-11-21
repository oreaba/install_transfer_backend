#!/bin/bash
# read -p "step 6"

# running the project

echo "6.1 Installing virtual  environemnt ..."
# cd /var/www/zakaa_backend/
# ls -ld /var/www/zakaa_backend/
pip3 install virtualenv

echo "6.2 Activating virtual environment ..."

cd /var/www/zakaa_backend/
virtualenv .venv && source .venv/bin/activate
which python

echo "6.3 Installing Project Dependencies ..."
pip install -r requirements.txt

echo "6.4 setting project settings and environment variables [.env] ..."
# copy the environment variable file:
sudo cp ~/transfer_installer/env.env /var/www/zakaa_backend/.env
cat /var/www/zakaa_backend/.env


echo "6.5 Applying Database Migrations ..."
python manage.py makemigrations
python manage.py migrate
# python manage.py createsuperuser --email mhamdy@aucegypt.edu
# if you don’t want to enter password now:  

echo "6.6 Creating Superuser ..."
python manage.py createsuperuser --email mhamdy@aucegypt.edu --noinput

echo "6.7 Generating Project Static Assets ..."
# creating static files for all the project so that they are served by nginx
python manage.py collectstatic
# 199 static files copied to '/var/www/zakaa_backend/static', 619 post-processed.

# python manage.py runserver

# from a new tab run 
#curl localhost:8000
# if all is ok press ctrl + c
