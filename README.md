# install_transfer_backend
## This script will install Zakaa Transfer Backend automatically
## before your instance run, execute the following commands:
## you can review the log through this file:
## tail -f /var/log/my_install.log

#!/bin/bash
cd /var
mkdir log
exec > >(tee /var/log/my_install.log|logger -t user-data -s 2>/dev/console) 2>&1
cd ~
yum -y install wget unzip
wget https://github.com/oreaba/install_transfer_backend/archive/main.zip 
unzip main.zip
sudo mv install_transfer_backend-main install
cd install
sudo chmod +x *.*
./10_install_all.sh