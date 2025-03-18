#!/bin/bash
# Utiliza esto para tus datos de usuario
# Instala httpd (Version: Linux 2)
sudo yum update -y
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<h1>Deployed via Terraform from $(hostname -f)</h1>" > /var/www/html/index.html