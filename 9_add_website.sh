#!/bin/bash
# read -p "step 9"

echo "9.1 Configuring nginx webserver ..."
# now adding a line in the nginx config to detect the conf files
# Define the line to be added
LINE_TO_ADD="include /etc/nginx/sites-enabled/*.conf;"
# Specify the nginx.conf file
NGINX_CONF_FILE="/etc/nginx/nginx.conf"
# Use sed to add the line after the 'http' block
sudo sed -i '/http {/a\'"$LINE_TO_ADD" "$NGINX_CONF_FILE"

echo "9.2 Adding the website to ngnix webserver ..."
# configure nginx with zakaa transfer app
CONFIGURATION="
server {
    client_max_body_size 1m;
    location / {
        proxy_pass http://0.0.0.0:8000/; # gunicorn server is running here
    }
     location /static/{
         root /var/www/zakaa_backend;
    }
    location /supervisor {
        proxy_pass http://0.0.0.0:9001/;
        proxy_redirect http://0.0.0.0:9001/ /supervisor/;
    }
}
"
# writing the file 
echo "$CONFIGURATION" | sudo tee /etc/nginx/sites-available/transfer.conf > /dev/null
# Create a symlink of this configuration file in sites-enabled
sudo ln -s /etc/nginx/sites-available/transfer.conf /etc/nginx/sites-enabled/

echo "9.3 Restarting nginx & running the application ..."
sudo nginx -t
sudo systemctl reload nginx
sudo systemctl restart nginx
# systemctl status nginx.service
# run the backend application

# cd /var/www/zakaa_backend
# /var/www/zakaa_backend/.venv/bin/gunicorn zakaa.wsgi:application

#Open in your browser
