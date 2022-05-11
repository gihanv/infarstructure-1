#!/bin/bash
set -e

sudo bash -c "exec > >( tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console ) 2>&1"

sudo apt update -y &&
sudo apt install  apache2 python3-pip awscli -y &&
sudo bash -c 'echo "Hello World `date`" > /var/www/html/index.html ' &&
sudo pip install boto3 && sudo pip3 install --upgrade awscli &&
sudo systemctl enable apache2 &&
sudo systemctl start apache2

