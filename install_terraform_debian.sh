#!/bin/bash
ssh-keygen
cd ~/.ssh/
cat id_rsa.pub
echo "Copy the above pub key for Github"
sleep 3
cd ~/
sudo apt-get install git
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
sudo apt-get install wget
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt-get install terraform=0.13.6
read -p "Email? for github config" git_email
read -p "user name for github" git_name
git config --global user.email $git_email
git config --global user.name $git_name
