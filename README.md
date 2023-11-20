# install_transfer_backend
## This script will install Zakaa Transfer Backend automatically
## before your instance run, execute the following commands:
cd ~
yum -y install wget unzip
wget https://github.com/oreaba/install_transfer_backend/archive/main.zip 
unzip main.zip
sudo mv install_transfer_backend-main install
cd install
sudo chmod +x *.*
./10_install_all.sh