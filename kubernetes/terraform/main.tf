terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

module "master" {
  source          = "./modules/master"
  public_key_path = var.public_key_path
  app_disk_image  = var.disk_id
  subnet_id       = var.subnet_id
}
module "worker" {
  source          = "./modules/worker"
  public_key_path = var.public_key_path
  db_disk_image   = var.disk_id
  subnet_id       = var.subnet_id
}
