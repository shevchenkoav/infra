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

ssh-keygen -t rsa -f ~/.ssh/appuser -C appuser ""

gcloud config set project [Project_name]
gcloud compute instances create --boot-disk-size=10GB --image=ubuntu-1604-xenial-v20170815a --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --zone=europe-west1-b reddit-app
// --metadata-from-file startup-script=/Users/anton/infra/install.sh

gcloud compute instances list --format json
#for ansible (cygwin) on windows need copy ssh-keys from c:/users/username/.ssh/*sshkeys* (if exist).

cp ansible directory
ansible-playbook -u ubuntu -i "{IP}," packer_app.yml

ansible-playbook reddit_app.yml --limit db --syntax-check
#pip install ansible-lint

# GCP Compute engine management with ansible
https://cloud.google.com/solutions/google-compute-engine-management-puppet-chef-salt-ansible#ansible

#Dynamic inventory
--


#Create disk in GCE
gcloud compute disks create --image-project ubuntu-os-cloud --image-family ubuntu-1604-lts --zone europe-west3-a disk1

#Create image (+ virtualization) in GCE

gcloud compute images create nested-vm-image \
--source-disk disk1 --source-disk-zone europe-west3-a \
--licenses "https://www.googleapis.com/compute/v1/projects/vm-options/global/licenses/enable-vmx"

#Create VM
gcloud compute instances create homework13 --zone europe-west3-a --image nested-vm-image

#Connect over ssh
gcloud compute ssh homework13 --zone europe-west3-a

# установка virtualbox
sudo apt-get update && sudo apt-get install -y virtualbox
# установка vagrant
wget https://releases.hashicorp.com/vagrant/2.0.0/vagrant_2.0.0_x86_64.deb
sudo dpkg -i vagrant_2.0.0_x86_64.deb
vagrant -v

# Устанавливаем Ansible:
sudo apt-get install -y python-pip
pip install --upgrade pip
pip install ansible

#Устанавливаем Vagrant и Ansible локально в OS X

#Запускаем
vagrant up --provider=virtualbox
vagrant box list
vagrant status
vagrant ssh appserver
ping -c 2 10.10.10.20
exit
vagrant reload appserver
vagrant destroy -f / <id>
vagrant box remove -f [name]

#install virtualenv & virtualenvwrapper
http://docs.python-guide.org/en/latest/dev/virtualenvs/
pip install --user pipenv
pip install virtualenv
sudo pip3 install virtualenvwrapper
add PATH
virtualenv "virtualenv"
cd "myproject" (virtualenv)
pipenv install requests

#activate virtualenv
source virtualenv/bin/activate
pip install -r ../requirements.txt
cd ansible/roles/db
molecule init scenario --scenario-name default -r db -d vagrant
add tests
molecule create
molecule list
molecule login -h instance
molecule lint
molecule Converge
