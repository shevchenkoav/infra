#!/usr/bin/env bash
#
#deploy reddit app and enable puma service
rm -rf reddit
git clone https://github.com/shevchenkoav/reddit.git
cd reddit
bundle install
sudo curl -Ssl https://github.com/shevchenkoav/infra/blob/base-os-packer/packer/files/puma.service > puma.service
sudo cp puma.service /etc/systemd/system
sudo systemctl enable puma.service
