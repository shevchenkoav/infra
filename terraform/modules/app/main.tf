 # Сборка ресурса инстанса с деплоем приложения (FRY).

resource "google_compute_instance" "app" {
  name          = "reddit-app"
  machine_type  = "g1-small"
  zone          = "europe-west1-b"
  tags          = ["reddit-app"]

  # Определение загрузочного диска
  boot_disk {
    initialize_params {
      image     = "${var.app_disk_image}"
    }
  }

  # определение сетевого интерфейса
  network_interface {
    # сеть, к которой присоединить данный интерфейс
    network     = "default"

    #Добавляем связанный ресурс
    access_config = {
      nat_ip = "${google_compute_address.app_ip.address}"
    }

    # использовать ephemeral IP для доступа из Интернет
    #access_config = {}
  }

  #Определяем ssh key
  metadata {
    sshKeys     = "appuser:${file(var.public_key_path)}"
  }

#  connection {
#    type        = "ssh"
#    user        = "appuser"
#    agent       = false
#    private_key = "${file(var.private_key_path)}"
#  }
#
#  provisioner "file" {
#    source      = "files/puma.service"
#    destination = "/tmp/puma.service"
#  }
#
#  provisioner "remote-exec" {
#    script      = "files/deploy.sh"
#  }
}

 # адрес IP

 resource "google_compute_address" "app_ip" {
   name = "reddit-app-ip"
 }

resource "google_compute_firewall" "firewall_puma" {
    name        = "allow-puma-default"

  # Название сети, в которой действует правило
    network     = "default"

  # Какой доступ разрешить
  allow {
    protocol    = "tcp"
    ports       = ["9292"]
  }

  # Каким адресам разрешаем доступ
  source_ranges = ["0.0.0.0/0"]

  # Правило применимо для инстансов с тегом ...
  target_tags   = ["reddit-app"]
}

#resource "google_compute_firewall" "firewall_ssh" {
#  name          = "default-allow-ssh"
#  network       = "default"
#
#  allow {
#    protocol    = "tcp"
#    ports       = ["22"]
#  }
#
#  source_ranges = ["0.0.0.0/0"]
#}
