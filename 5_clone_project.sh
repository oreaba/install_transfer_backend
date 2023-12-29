#!/bin/bash
# read -p "step 5"

echo "5.1 Cloning the project from bitbucket repository ..."
sudo chmod 600 /root/.ssh/transfer_backend_ssh_key
# -----------------------Add key temporarily-------------------------
eval "$(ssh-agent -s)"
ssh-add /root/.ssh/transfer_backend_ssh_key
ssh-add -l
# ------------Add key Permanently in root user only------------------
# 
CONFIGURATION="
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/transfer_backend_ssh_key
"
echo "$CONFIGURATION" | sudo tee /root/.ssh/config > /dev/null
# -------------------------------------------------------------------s

cd /opt/
# disables strict host key checking, 
# meaning that the client will automatically accept any new host keys without prompting.
ssh -o StrictHostKeyChecking=no -T git@bitbucket.org
echo "Fetching project."
git clone git@bitbucket.org:diamond-professional/zakaa_backend.git
echo "Finished Cloning."

echo "Finished Cloning."
which python3
python3 -m pip install virtualenv
echo "Finished installing venv."
