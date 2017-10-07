#!/usr/bin/env bash
#
# deploy reddit app

git clone https://github.com/Artemmkin/reddit.git
cd reddit && bundle install
cd /etc/systemd/system
sudo curl -Ssl https://github.com/shevchenkoav/infra/blob/base-os-packer/packer/files/puma.service > puma.service
sudo systemctl enable puma.service

# cp puma.service /etc/systemd/system
# rm puma.service
# systemctl enable puma.service
# puma -d
