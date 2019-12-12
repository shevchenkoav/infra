# Учебный репозиторий по курсу DevOps, от компании [Экспресс 42](https://express42.com/)

INFO: bake Puma web-сервер for Ruby, MongoDB server on GCP infrastructure.

# Terraform
without provisioning: without [connection],[provisioner].
without deploy.sh & mv puma.service to gcp instances

# GCE
# Use this command to create virtual machine and deploy Puma application

gcloud config set project [Project_name]

1. gcloud compute instances create --boot-disk-size=10GB --image=ubuntu-1604-xenial-v20170815a --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --zone=europe-west1-b reddit-app --metadata-from-file startup-script=/Users/anton/infra/install.sh

Обновление знаний от 2020
