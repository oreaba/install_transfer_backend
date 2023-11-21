#!/bin/bash
# read -p "step 1"
echo "1.1 Updating System ..."
sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum install -y epel-release
sudo yum -y update

echo "1.2 Installing Tools ..."
sudo yum -y install git nano wget