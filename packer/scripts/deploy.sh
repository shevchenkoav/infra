#!/usr/bin/env bash
#
# deploy reddit app
git clone https://github.com/shevchenkoav/reddit.git
cd reddit && bundle install

# enable puma service.
sudo curl -Ssl https://raw.githubusercontent.com/shevchenkoav/infra/master/packer/files/puma.service > puma.service
sudo cp puma.service /etc/systemd/system
sudo systemctl start puma
sudo systemctl enable puma
