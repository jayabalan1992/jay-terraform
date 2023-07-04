#!/bin/bash
ssh-keygen
cd ~/.ssh/
cat id_rsa.pub
echo "Copy the above pub key for Github"
sleep 3
cd ~/
sudo yum install git -y
sudo yum update && sudo yum install -y gnupg software-properties-common
gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
sudo yum install wget
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform
read -p "Email? for github config" git_email
read -p "user name for github" git_name
git config --global user.email $git_email
git config --global user.name $git_name
