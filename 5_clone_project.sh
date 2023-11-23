#!/bin/bash
# read -p "step 5"


echo "5.1 Cloning the project from bitbucket repository ..."
eval "$(ssh-agent -s)"
ssh-add /root/.ssh/transfer_ssh_key
ssh-add -l
cd /opt/
# disables strict host key checking, 
# meaning that the client will automatically accept any new host keys without prompting.
ssh -o StrictHostKeyChecking=no -T git@bitbucket.org
echo "Fetching project."
git clone git@bitbucket.org:diamond-professional/zakaa_backend.git
echo "Finished Cloning."