#!/bin/bash
# read -p "step 5"

echo "5.1 Cloning the project from bitbucket repository ..."
sudo mkdir -p /var/www/
BITBUCKET_REPO="git@bitbucket.org:diamond-professional/zakaa_backend.git"
git clone $BITBUCKET_SSH_URL /var/www/	# do not run this using sudo
# sudo mv ~/zakaa_backend /var/www/

echo "5.2 Installing virtualenvironemnt ..."
cd /var/www/zakaa_backend/
ls -ld /var/www/zakaa_backend/
pip3 install virtualenv

echo "5.3 Installing project dependencies ..."
virtualenv .venv && source .venv/bin/activate
which python
pip3 install -r requirements.txt

echo "5.4 setting project settings and environment variables [.env] ..."
# copy the environment variable file:
sudo cp ~/install/env.env /var/www/zakaa_backend/.env
cat /var/www/zakaa_backend/.env