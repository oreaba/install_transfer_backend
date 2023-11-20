#!/bin/bash
# read -p "step 4"

# CLONE PROJECT: setting up ssh keys
mkdir -p ~/.ssh
chmod 700 ~/.ssh
cd ~/.ssh/
ssh-keygen -t ed25519 -b 4096 -C "mohamed.hamdy@diamond-dpc.com" -f transfer_ssh_key -N ""
eval "$(ssh-agent)"
ssh-add ~/.ssh/transfer_ssh_key
# ssh-add -l 				# will verify your added key
cat transfer_ssh_key.pub
echo "copy this public key string and add it to the bitbucket authorized ssh keys"
read -p "Press Enter to continue... (after you add your key there)"

# CLONE PROJECT: downloading code and move it to www
# add bitbucket fingerprint to known hosts to skip the prompt
ssh-keyscan -t ecdsa bitbucket.org >> ~/.ssh/known_hosts
cd ~
git clone git@bitbucket.org:diamond-professional/zakaa_backend.git	# do not run this using sudo
sudo mkdir -p /var/www/
sudo mv ~/zakaa_backend /var/www/

echo "installing virtualenvironemnt and installing dependencies..."
cd /var/www/zakaa_backend/
ls -ld /var/www/zakaa_backend/

pip3 install virtualenv
virtualenv .venv && source .venv/bin/activate
which python
pip3 install -r requirements.txt

# copy the environment variable file:
sudo cp ~/scripts/env.env /var/www/zakaa_backend/.env
cat /var/www/zakaa_backend/.env
