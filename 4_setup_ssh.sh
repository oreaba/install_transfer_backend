#!/bin/bash
whoami # temp
sudo yum -y install git nano wget # temp

echo "4.1 Generating SSH public and private key..."
mkdir -p /root/.ssh
chmod 700 /root/.ssh
cd /root/.ssh/
ssh-keygen -t rsa -b 4096 -C "mohamed.hamdy@diamond-dpc.com" -f transfer_ssh_key -N ""
chmod 600 /root/.ssh/transfer_ssh_key
eval "$(ssh-agent -s)"
ssh-add /root/.ssh/transfer_ssh_key
ssh-add -l

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
whoami
pwd
ssh-add -l
cd /opt/
ssh -o StrictHostKeyChecking=no -T git@bitbucket.org
git clone git@bitbucket.org:diamond-professional/zakaa_backend.git
whoami