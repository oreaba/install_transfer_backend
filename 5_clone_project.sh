#!/bin/bash
# read -p "step 5"

echo "5.1 Cloning the project from bitbucket repository ..."
BITBUCKET_REPO="git@bitbucket.org:diamond-professional/zakaa_backend.git"
TARGET_DIRECTORY="/var/www/zakaa_backend/"

# Create the target directory if it doesn't exist
mkdir -p "$TARGET_DIRECTORY"

# Clone the repository into the target directory
git clone "$BITBUCKET_REPO" "$TARGET_DIRECTORY" # do not run this using sudo to be the owner	
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