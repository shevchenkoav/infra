#!/usr/bin/env bash
#
# deploy reddit app
git clone https://github.com/Artemmkin/reddit.git
cd reddit && bundle install
puma -d
