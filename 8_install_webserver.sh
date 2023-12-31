#!/bin/bash
# read -p "step 8"

echo "8.1 Installing Web Server: nginx ..."
# install & configure nginx — a professional web server to interface with the outside world
# install from source:
yum install pcre pcre-devel openssl-devel perl gcc make -y

useradd nginx
usermod -s /sbin/nologin nginx

mkdir -p /etc/nginx
mkdir -p /var/log/nginx
mkdir -p /var/cache/nginx

cd /usr/src/
wget https://nginx.org/download/nginx-1.24.0.tar.gz
tar xzvf nginx-1.24.0.tar.gz

cd nginx-1.24.0

./configure --prefix=/etc/nginx --sbin-path=/usr/sbin/nginx --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --pid-path=/var/run/nginx.pid --lock-path=/var/run/nginx.lock --http-client-body-temp-path=/var/cache/nginx/client_temp --http-proxy-temp-path=/var/cache/nginx/proxy_temp --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp --http-scgi-temp-path=/var/cache/nginx/scgi_temp --user=nginx --group=nginx --with-http_ssl_module --with-http_realip_module --with-http_addition_module --with-http_sub_module --with-http_dav_module --with-http_flv_module --with-http_mp4_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_random_index_module --with-http_secure_link_module --with-http_stub_status_module --with-http_auth_request_module --with-mail --with-mail_ssl_module --with-file-aio --with-cc-opt='-O2 -g -pipe -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -m64 -mtune=generic'

make 
make install

mkdir /etc/nginx/sites-available
mkdir /etc/nginx/sites-enabled

echo "8.2 Adding the Web Server to the system services ..."
# Define the configuration
CONFIGURATION="[Unit]
Description=nginx - high performance web server
Documentation=http://nginx.org/en/docs/
After=network.target remote-fs.target nss-lookup.target

[Service]
Type=forking
PIDFile=/run/nginx.pid
ExecStartPre=/usr/sbin/nginx -t -c /etc/nginx/nginx.conf
ExecStart=/usr/sbin/nginx -c /etc/nginx/nginx.conf
ExecReload=/bin/kill -s HUP \$MAINPID
ExecStop=/bin/kill -s QUIT \$MAINPID
PrivateTmp=true

[Install]
WantedBy=multi-user.target"

# Create or overwrite the nginx.service file
echo "$CONFIGURATION" | sudo tee /usr/lib/systemd/system/nginx.service > /dev/null

echo "8.3 Restarting the Web Server ..."
# Reload systemd to pick up the new service file
systemctl daemon-reload
systemctl start nginx.service
systemctl enable nginx.service
systemctl status nginx
curl localhost:80