provider "google" {
  project       = "${var.project}"
  region        = "${var.region}"
#  version       = "0.1.3"
}

#terraform get [modules]
module "app" {
  source              = "modules/app"
  public_key_path     = "${var.public_key_path}"
  app_disk_image      = "${var.app_disk_image}"
}

module "db" {
  source              = "modules/db"
  public_key_path     = "${var.public_key_path}"
  db_disk_image      = "${var.db_disk_image}"
}
