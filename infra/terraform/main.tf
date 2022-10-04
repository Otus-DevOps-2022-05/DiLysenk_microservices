# terraform init инициализация
# terraform validate валидация
# terraform fmt форматирование файлов к общему виду
# terraform plan вывод изменений
# terraform apply применяет изменения
# terraform destroy

data "yandex_compute_image" "ubuntu-20-04" {
  family = "ubuntu-2004-lts"
}

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
  name = var.name

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      # указывается id образа  Yandex Cloud Marketplace
      # https://cloud.yandex.ru/marketplace
      image_id = data.yandex_compute_image.ubuntu-20-04.id
      size = 60
    }
  }

  network_interface {
    # Указан id подсети default-ru-central1-a (не vps, а подсеть vps)
    subnet_id = var.subnet_id
    nat       = true
  }
    metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
}
