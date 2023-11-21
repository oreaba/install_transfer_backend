

# in your AWS instance pre-initialization add the following:
curl -s -S -L https://raw.githubusercontent.com/oreaba/install_transfer_backend/main/installer | bash

# capture both stdout and stderr in a log file for later analysis and debugging
# exec > >(tee ~/install_transfer.log|logger -t install-transfer -s 2>/dev/console) 2>&1
# exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
