#!/bin/bash
# install python
# read -p "step 2"

sudo yum install -y gcc openssl-devel bzip2-devel libffi-devel zlib-devel
cd /usr/src/
sudo wget https://www.python.org/ftp/python/3.9.5/Python-3.9.5.tgz
sudo tar xvf Python-3.9.5.tgz
cd Python-3.9.5
sudo ./configure --enable-optimizations
sudo make altinstall
python3.9 --version
which python3.9
which python3.9
sudo ln -s /usr/local/bin/python3.9 /usr/local/bin/python3
sudo ln -s /usr/local/bin/pip3.9 /usr/local/bin/pip3
python3 --version