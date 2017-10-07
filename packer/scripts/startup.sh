#!/usr/bin/env bash
#
# install&deploy https://github.com/Artemmkin/reddit

curl -Ssl https://raw.githubusercontent.com/shevchenkoav/infra/base-os-packer/packer/scripts/install_ruby.sh \
	| sudo -u appuser -i bash
curl -Ssl https://raw.githubusercontent.com/shevchenkoav/infra/base-os-packer/packer/scripts/install_mongodb.sh \
	| bash
curl -Ssl https://raw.githubusercontent.com/shevchenkoav/infra/base-os-packer/packer/scripts/deploy.sh \
	| sudo -u appuser -i bash
