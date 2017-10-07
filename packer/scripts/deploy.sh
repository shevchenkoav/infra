#!/usr/bin/env bash
#
# deploy reddit app

git clone https://github.com/Artemmkin/reddit.git
cd reddit && bundle install
cd /etc/systemd/system
sudo wget https://github.com/shevchenkoav/infra/blob/base-os-packer/packer/files/puma.service
sudo systemctl enable puma.service
#wget https://raw.githubusercontent.com/shevchenkoav/infra/base-os-packer/packer/files/puma.service
# cp puma.service /etc/systemd/system
# rm puma.service
# systemctl enable puma.service
# puma -d
