#!/bin/bash

echo "4.1 Generating SSH public and private key..."
mkdir -p ~/.ssh
chmod 700 ~/.ssh
cd ~/.ssh/
eval "$(ssh-agent -s)"
ssh-keygen -t rsa -b 4096 -f -C "mohamed.hamdy@diamond-dpc.com" -f transfer_ssh_key_test -N ""
eval "$(ssh-agent)"
ssh-add ~/.ssh/transfer_ssh_key_test


echo "4.2 Add SSH public key to Bitbucket using the API ..."
#BITBUCKET_REPO="git@bitbucket.org:diamond-professional/zakaa_backend.git"
BITBUCKET_USERNAME="moreaba"
BITBUCKET_APP_PASSWORD="ATBB8d7twGyuLHMDHKfrfNhHjPvv9933B622"

# Add public key to Bitbucket using the API
PUBLIC_KEY=$(cat ~/.ssh/transfer_ssh_key_test.pub)
curl -u $BITBUCKET_USERNAME:$BITBUCKET_APP_PASSWORD \
     -X POST \
     -H "Content-Type: application/json" \
     -d '{"key": "'"$PUBLIC_KEY"'", "label": "EC2 Instance RHEL 7.9"}' \
     https://api.bitbucket.org/2.0/users/"$BITBUCKET_USERNAME"/ssh-keys