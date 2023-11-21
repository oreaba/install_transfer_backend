#!/bin/bash
# read -p "step 5"

echo "5.1 Cloning the project from bitbucket repository ..."
BITBUCKET_REPO="git@bitbucket.org:diamond-professional/zakaa_backend.git"
TARGET_DIRECTORY="/var/www/zakaa_backend/"

# Create the target directory if it doesn't exist
sudo mkdir -p "$TARGET_DIRECTORY"

# Clone the repository into the target directory
git clone git@bitbucket.org:diamond-professional/zakaa_backend.git
# "$BITBUCKET_REPO" #"$TARGET_DIRECTORY" # do not run this using sudo to be the owner	
sudo mv ~/zakaa_backend /var/www/
