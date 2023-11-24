#!/bin/bash
whoami # temp

echo "4.1 Generating SSH public and private key..."
sudo mkdir -p /root/.ssh
sudo chmod 700 /root/.ssh
cd /root/.ssh/
ssh-keygen -R bitbucket.org   # remove existing keys
ssh-keygen -t rsa -b 4096 -C "mohamed.hamdy@diamond-dpc.com" -f transfer_ssh_key -N ""
# sudo chmod 600 /root/.ssh/transfer_ssh_key
# eval "$(ssh-agent -s)"
# ssh-add /root/.ssh/transfer_ssh_key
# ssh-add -l

echo "4.2 Add SSH public key to Bitbucket using the API ..."
#BITBUCKET_REPO="git@bitbucket.org:diamond-professional/zakaa_backend.git"
BITBUCKET_USERNAME="moreaba"
BITBUCKET_APP_PASSWORD="ATBB8d7twGyuLHMDHKfrfNhHjPvv9933B622"

# Add public key to Bitbucket using the API
PUBLIC_KEY=$(cat ~/.ssh/transfer_ssh_key.pub)
curl -u $BITBUCKET_USERNAME:$BITBUCKET_APP_PASSWORD \
     -X POST \
     -H "Content-Type: application/json" \
     -d '{"key": "'"$PUBLIC_KEY"'", "label": "EC2 Instance RHEL 7.9"}' \
     https://api.bitbucket.org/2.0/users/"$BITBUCKET_USERNAME"/ssh-keys

