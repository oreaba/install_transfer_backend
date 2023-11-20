#!/bin/bash
# read -p "step 9"

echo "1. Installing Supervisor ..."

sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm		
sudo yum info supervisor
sudo yum install -y supervisor
supervisord --version				# 3.4.0


which supervisord
#/usr/bin/supervisord
which supervisorctl
#/usr/bin/supervisorctl
sudo systemctl enable supervisord
sudo systemctl start supervisord
sudo systemctl status supervisord


echo "2. Configuring Supervisor at localhost:9001..."
#"/etc/supervisord.conf" 
CONFIGURATION="
[inet_http_server]
port=127.0.0.1:9001
"
echo "$CONFIGURATION" | sudo tee -a /etc/supervisord.conf > /dev/null

# adding transfer backend
CONFIGURATION="
[program:transfer_backend]
command = /var/www/zakaa_backend/.venv/bin/gunicorn zakaa.wsgi:application --bind 0.0.0.0:8000 --workers 1 --timeout 60 --error-logfile /var/log/gunicorn.error.log
directory = /var/www/zakaa_backend/
user = root
autostart = true
autorestart = true
stdout_logfile = /var/log/zakaa.log
stderr_logfile = /var/log/zakaa.error.log
"
echo "$CONFIGURATION" | sudo tee /etc/supervisord.d/transfer_backend.ini > /dev/null

# restart super visor and run application
echo "3. Restarting supervisor & running the gunicorn app"

sudo supervisorctl reread
sudo supervisorctl reload
sudo supervisorctl restart  all
# sudo supervisorctl restart transfer_backend

# transfer_backend                    RUNNING   pid 1874, uptime 0:00:20

curl localhost:80				# shows nginx successfully 
curl localhost:8000			# shows Django app successfully
curl localhost:9001			# shows supervisor successfully 
echo ""
echo "Finished."
sudo supervisorctl status