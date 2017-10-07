#!/usr/bin/env bash
#
# deploy reddit app

git clone https://github.com/Artemmkin/reddit.git
cd reddit && bundle install

#wget https://raw.githubusercontent.com/shevchenkoav/infra/base-os-packer/packer/files/puma.service
# cp puma.service /etc/systemd/system
# rm puma.service
# systemctl enable puma.service
# puma -d
