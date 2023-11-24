#!/bin/bash
# read -p "step 3"

echo "3.1 Installing postgres SQL server v14 ..."
sudo yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
sudo yum -y install postgresql14-server
psql --version # psql (PostgreSQL) 14.10
sudo /usr/pgsql-14/bin/postgresql-14-setup initdb
sudo systemctl enable --now postgresql-14
systemctl status postgresql-14
#sudo -u postgres psql -c "SHOW hba_file;"

echo "3.2 Creating Database for the transfer_backend..."
cd /
sudo -u postgres HOME=/var/src/ psql -c "CREATE DATABASE transfer;"
sudo -u postgres HOME=/var/src/ psql -c "ALTER USER postgres WITH password '@E000000';"

# psql -U postgres -h localhost -d diamond -W 	# this will prompt for password
# psql —username postgres —host localhost —dbname diamond —password 	# this will prompt for password
# PGPASSWORD=@E000000 psql -U postgres -h localhost -d diamond