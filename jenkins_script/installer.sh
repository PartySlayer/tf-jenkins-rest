#!/bin/bash

wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo apt-key add -

sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

sudo apt update

sudo apt install -y openjdk-11-jdk

sudo apt install -y jenkins

sudo apt upgrade -y

sudo systemctl start jenkins

sudo systemctl enable jenkins

pass=$(sudo cat /var/lib/jenkins/secrets/initialAdminPassword)

echo "Jenkins initial admin password: $pass"