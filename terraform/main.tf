provider "google" {
  project = "terraform-project-182418"
  region = "europe-west1"
  version = "0.1.3"
}
resource "google_compute_instance" "app" {
  name          = "reddit-app"
  machine_type  = "g1-small"
  zone          = "europe-west1-b"
  # Определение загрузочного диска
  boot_disk {
    initialize_params {
      image = "reddit-base-1507724278"
    }
  }
  # определение сетевого интерфейса
  network_interface {

    # сеть, к которой присоединить данный интерфейс
    network = "default"

    # использовать ephemeral IP для доступа из Интернет
    access_config {}
  }
  #Определим ssh key
  metadata {
  sshKeys = "appuser:${file("~/.ssh/appuser")}"
  }
}
