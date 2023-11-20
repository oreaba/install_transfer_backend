#!/bin/bash
# read -p "step 6"

# installing a wsgi web server instead of the local development sever shipped with Django
# there us uWSGI & Gunicorn - we will go with gunicorn
cd /var/www/zakaa_backend/
source .venv/bin/activate
pip3 install gunicorn
# gunicorn zakaa.wsgi:application
# curl localhost:8000
# if all is ok press ctrl + c
sudo touch /var/log/gunicorn.error.log
sudo chown $(whoami):$(whoami) /var/log/gunicorn.error.log
#find gunicorn and kill it
# ps ax|grep gunicorn
# pkill gunicorn