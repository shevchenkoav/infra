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
