#!/bin/bash
# read -p "step 2"

echo "2.1 Installing Python 3.9.5 ..."
# Check if Python 3.9 is already installed
if command -v python3.9 &> /dev/null; then
    echo "Python 3.9 is already installed. Skipping compilation."
else
    sudo yum install -y gcc openssl-devel bzip2-devel libffi-devel zlib-devel
    cd /usr/src/
    sudo wget https://www.python.org/ftp/python/3.9.5/Python-3.9.5.tgz
    sudo tar xvf Python-3.9.5.tgz
    cd Python-3.9.5
    sudo ./configure --enable-optimizations
    sudo make altinstall
    sudo ln -s /usr/local/bin/python3.9 /usr/local/bin/python3
    sudo ln -s /usr/local/bin/pip3.9 /usr/local/bin/pip3
    export PATH="/usr/local/bin:$PATH"
    /usr/local/bin/python3 -m pip install --upgrade pip
    # sudo ln -s /usr/local/bin/pip3.9 /usr/bin/pip3.9

fi

echo "2.2 Checking Installation ..."
python3.9 --version
which python3.9
python3 --version
pip3 --version
# Alternative Solution:
# sudo yum install -y patch ncurses-devel sqlite-devel readline-devel xz-devel
# curl https://pyenv.run | bash
# echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc
# echo 'eval "$(pyenv init --path)"' >> ~/.bashrc
# echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
# source ~/.bashrc
# pyenv install 3.9.5
# which python3
#~/.pyenv/shims/python3