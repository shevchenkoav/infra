provider "google" {
  project = "${var.project}"
  region  = "${var.region}"
}

resource "google_storage_bucket" "state-store" {
  name     = "tfstate-store-sav"
  location = "${var.region}"
  storage_class = ${var.type}
}
