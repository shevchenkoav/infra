# Ansible

#for windows

Install cygwin from https://cygwin.com/install.html

Install the following packages:
    wget (wget raw.github.com/transcode-open/apt-cyg/master/apt-cyg)
    curl
    python
    python-devel
    python-setuptools
    python-crypto
    openssl
    openssl-devel
    libffi-devel
    gcc-g++
    vim, nano
    git
    libyaml
    libyaml-devel
    python-openssl
    python-paramiko
    openssh

Install pip
  easy_install-2.7 pip

Install Ansible
  pip install ansible

# Successfully installed ansible-2.4.0.0

#or
type apt-cyg || exit
apt-cyg install git python-{jinja2,six,yaml}
git clone --depth 1 git://github.com/ansible/ansible
cd ansible
PATH+=:~+/bin
export PYTHONPATH=~+/lib
ansible --version

make playbooks:
[packer_app](https://gist.githubusercontent.com/serjs/906b243d3b0debfd54657b50ca3e2cc2/raw/0d67c5b1f1a0f74ed435a63cc2130a1dbc459896/reddit_app.yml)
[packer_db](https://gist.githubusercontent.com/serjs/3907500c4d6e0a805d26acee3e7ec4bb/raw/ee316deadb6c35effadd0947bb8d05efaec50c89/reddit_db.yml)

# generate and copy public key to GCP
ssh-keygen -t rsa -f ~/.ssh/appuser -C appuser -P ""


# GCE (Use this command to create virtual machine and deploy Puma application)

gcloud config set project [Project_name]
gcloud compute instances create --boot-disk-size=10GB --image=ubuntu-1604-xenial-v20170815a --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --zone=europe-west1-b reddit-app
// --metadata-from-file startup-script=/Users/anton/infra/install.sh

gcloud compute instances list --format json
#for ansible (cygwin) on windows need copy ssh-keys from c:/users/username/.ssh/*sshkeys*

cp ansible directory
ansible-playbook -u ubuntu -i "35.195.55.233," packer_app.yml
