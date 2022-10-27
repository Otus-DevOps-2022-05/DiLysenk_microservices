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
  subnet_id       = var.subnet_id
  private_key_path = var.private_key_path
}

module "worker" {
  source          = "./modules/worker"
  public_key_path = var.public_key_path
  subnet_id       = var.subnet_id
  private_key_path = var.private_key_path
}
