# install_transfer_backend
## This script will install Zakaa Transfer Backend automatically
## before your instance run, execute the following commands:
## you can review the log through this file:
## tail -f /var/log/install_transfer.log

#!/bin/bash
mkdir -p /var/log/
# capture both stdout and stderr in a log file for later analysis and debugging
exec > >(tee /var/log/install_transfer.log|logger -t install-transfer -s 2>/dev/console) 2>&1
yum -y install wget unzip
wget https://github.com/oreaba/install_transfer_backend/archive/main.zip 
unzip main.zip
mv install_transfer_backend-main install_transfer
cd install_transfer
sudo chmod +x *.*
./install.sh