#!/bin/bash
curl -o /tmp/installer.sh https://raw.githubusercontent.com/oreaba/install_transfer_backend/main/installer
sudo chmod +x /tmp/installer.sh
source ./tmp/installer.sh

# TODO: the blow makes the script stop at 6 - needs retesting after addping pip to path
# curl https://raw.githubusercontent.com/oreaba/install_transfer_backend/main/installer | bash

## This script will install Zakaa Transfer Backend automatically
## you can review the log through this file:
# tail -f /var/log/transfer_installer.log
# or if you want to inspect on your local terminal:
# ssh -i "~/.ssh/rhel_test.pem" ec2-user@ec2-3-70-241-185.eu-central-1.compute.amazonaws.com 'tail -f /var/log/transfer_installer.log'

#####

# BITBUCKET_REPO="git@bitbucket.org:diamond-professional/zakaa_backend.git"
# TARGET_DIRECTORY="/var/www/zakaa_backend/"

# Create the target directory if it doesn't exist
# sudo mkdir -p "$TARGET_DIRECTORY"
# cd $TARGET_DIRECTORY
# Clone the repository into the target directory
# sudo git clone "$BITBUCKET_REPO" "$TARGET_DIRECTORY"
# "$BITBUCKET_REPO" #"$TARGET_DIRECTORY" # do not run this using sudo to be the owner	
# sudo mv ~/zakaa_backend /var/www/
# echo -e "Host bitbucket.org\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config
# GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" sudo git clone # # 
# git@bitbucket.org:diamond-professional/zakaa_backend.git /var/www/zakaa_backend
# ssh-keyscan bitbucket.org >> ~/.ssh/known_hosts
# ssh-keyscan git@bitbucket.org:diamond-professional/zakaa_backend.git >> ~/.ssh/known_hosts