# terraform init
# terraform validate
# terraform fmt
# terraform plan
# terraform apply

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

resource "yandex_compute_instance" "vm-1" {
  # имя создаваемой машины
  name = "docker-vm"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      # указывается id образа  Yandex Cloud Marketplace
      # https://cloud.yandex.ru/marketplace
      image_id = var.disk_id
    }
  }

  network_interface {
    # Указан id подсети default-ru-central1-a (не vps, а подсеть vps)
    subnet_id = var.subnet_id
    nat       = true
  }
}
