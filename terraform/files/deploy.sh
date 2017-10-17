#!/bin/bash
#
#deploy reddit app and enable puma service.
#
#Развертывание на базе образа: https://github.com/shevchenkoav/packer-immutable-gcloud-image.git

set -e

source ~/.profile
rm -rf reddit
git clone https://github.com/Artemmkin/reddit.git
cd reddit
bundle install

sudo mv /tmp/puma.service /etc/systemd/system/puma.service
sudo systemctl start puma
sudo systemctl enable puma
