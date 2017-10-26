provider "google" {
  project             = "${var.project}"
  region              = "${var.region}"
#  version            = "0.1.3"
}

# statefile (terraform.tfstate) -> remote backend

terraform {
  backend "gcs" {
    bucket  = "tfstate-store-sav"
    path    = "main/terraform.tfstate"
    project = "terraform-project-182418"
  }
}

# [modules] terraform get

module "app" {
  source              = "modules/app"
  public_key_path     = "${var.public_key_path}"
  app_disk_image      = "${var.app_disk_image}"
}

module "db" {
  source              = "modules/db"
  public_key_path     = "${var.public_key_path}"
  db_disk_image       = "${var.db_disk_image}"
}

module "vpc" {
  source              = "modules/vpc"
  public_key_path     = "${var.public_key_path}"
  source_ranges       = ["46.188.60.174/32"]
}
