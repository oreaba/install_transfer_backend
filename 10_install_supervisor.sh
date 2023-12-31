#!/bin/bash
# read -p "step 10"

echo "10.1. Installing Supervisor ..."

yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm		
yum info supervisor
yum install -y supervisor
supervisord --version				# 3.4.0


which supervisord
#/usr/bin/supervisord
which supervisorctl
#/usr/bin/supervisorctl
systemctl enable supervisord
systemctl start supervisord
systemctl status supervisord


echo "10.2 Configuring Supervisor at localhost:9001..."
#"/etc/supervisord.conf" 
CONFIGURATION="
[inet_http_server]
port=127.0.0.1:9001
"
echo "$CONFIGURATION" | sudo tee -a /etc/supervisord.conf > /dev/null

# adding transfer backend
CONFIGURATION="
[program:transfer_backend]
command = /opt/zakaa_backend/.venv/bin/gunicorn zakaa.wsgi:application --bind 0.0.0.0:8000 --workers 1 --timeout 60 --error-logfile /var/log/gunicorn.error.log
directory = /opt/zakaa_backend/
user = root
autostart = true
autorestart = true
stdout_logfile = /var/log/zakaa.log
stderr_logfile = /var/log/zakaa.error.log
"
echo "$CONFIGURATION" | sudo tee /etc/supervisord.d/transfer_backend.ini > /dev/null

# restart super visor and run application
echo "10.3 Restarting supervisor & running the gunicorn app"

supervisorctl reread
supervisorctl reload
supervisorctl restart  all
# sudo supervisorctl restart transfer_backend

# transfer_backend                    RUNNING   pid 1874, uptime 0:00:20

curl localhost:80				# shows nginx successfully 
curl localhost:8000			# shows Django app successfully
curl localhost:9001			# shows supervisor successfully 
echo ""
echo "Finished."
supervisorctl status