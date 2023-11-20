#!/bin/bash
# read -p "step 1"

sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum install -y epel-release
sudo yum -y update
# install tools
sudo yum -y install git nano wget