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
./1_update_system.sh
./2_install_python.sh
./3_install_postgres.sh
./4_setup_ssh.sh
./5_clone_project.sh
./6_run_project.sh
./7_install_gateway.sh
./8_install_webserver.sh
./9_add_webite.sh
./10_install_supervisor.sh