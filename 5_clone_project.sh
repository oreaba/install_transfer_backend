#!/bin/bash
# read -p "step 5"
sudo yum -y install git nano wget

echo "5.1 Cloning the project from bitbucket repository ..."
BITBUCKET_REPO="git@bitbucket.org:diamond-professional/zakaa_backend.git"
TARGET_DIRECTORY="/var/www/zakaa_backend/"

# Create the target directory if it doesn't exist
sudo mkdir -p "$TARGET_DIRECTORY"
cd $TARGET_DIRECTORY
# Clone the repository into the target directory
# sudo git clone "$BITBUCKET_REPO" "$TARGET_DIRECTORY"
# "$BITBUCKET_REPO" #"$TARGET_DIRECTORY" # do not run this using sudo to be the owner	
# sudo mv ~/zakaa_backend /var/www/
# echo -e "Host bitbucket.org\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config
GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" git clone git@bitbucket.org:diamond-professional/zakaa_backend.git /var/www/zakaa_backend
# ssh-keyscan bitbucket.org >> ~/.ssh/known_hosts
# ssh-keyscan git@bitbucket.org:diamond-professional/zakaa_backend.git >> ~/.ssh/known_hosts
