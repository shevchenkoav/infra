provider "google" {
  project = "terraform-project-182418"
  region = "europe-west1"
}

resource "google_compute_instance" "app" {
  name          = "reddit-app"
  machine_type  = "g1-small"
  zone          = "europe-west1-b"

  # Определение загрузочного диска
  boot_disk {
    initialize_params {
      image = "reddit-base-"
    }
  }
}
