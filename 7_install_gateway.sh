#!/bin/bash
# read -p "step 7"

# installing a wsgi web server instead of the local development sever shipped with Django
# there us uWSGI & Gunicorn - we will go with gunicorn
echo "7.1 Installing The Gatway server: GUNICORN ..."
cd /opt/zakaa_backend/
source .venv/bin/activate
pip install gunicorn
# gunicorn zakaa.wsgi:application
# curl localhost:8000
# if all is ok press ctrl + c

echo "7.2 Configuring The Gatway server: GUNICORN ..."
sudo touch /var/log/gunicorn.error.log
sudo chown $(whoami):$(whoami) /var/log/gunicorn.error.log
#find gunicorn and kill it
# ps ax|grep gunicorn
# pkill gunicorn