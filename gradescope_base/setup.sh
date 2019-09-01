#!/usr/bin/env bash

YOUR_REPO='git@github...'
REPO_FOLDER='myclass_assignments'

cd /autograder/source

apt-get install -y python3 python3-pip python3-dev

mkdir -p /root/.ssh
cp ssh_config /root/.ssh/config
# Make sure to include your private key here
cp deploy_key /root/.ssh/deploy_key
chmod 400 /root/.ssh/deploy_key
# To prevent host key verification errors at runtime
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts

# Clone autograder files
git clone $YOUR_REPO /autograder/$REPO_FOLDER
# Install python dependencies
pip3 install -r /autograder/$REPO_FOLDER/requirements.txt
