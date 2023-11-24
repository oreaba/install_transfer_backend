!/bin/bash
install python
# read -p "step 2"

echo "2.1 Installing Python 3.9.5 ..."
sudo yum install -y gcc openssl-devel bzip2-devel libffi-devel zlib-devel
cd /usr/src/
sudo wget https://www.python.org/ftp/python/3.9.5/Python-3.9.5.tgz
sudo tar xvf Python-3.9.5.tgz
cd Python-3.9.5
sudo ./configure --enable-optimizations
sudo make altinstall

echo "2.2 Checking Installation ..."
python3.9 --version
which python3
which python3.9
sudo ln -s /usr/local/bin/python3.9 /usr/local/bin/python3
sudo ln -s /usr/local/bin/pip3.9 /usr/local/bin/pip3
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