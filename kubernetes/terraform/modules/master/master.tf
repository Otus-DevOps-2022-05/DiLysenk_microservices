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


resource "yandex_compute_instance" "master" {
  name  = "node-master"
  count = var.instance_count
  # имя создаваемой машины

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      # указывается id образа  Yandex Cloud Marketplace
      # https://cloud.yandex.ru/marketplace
      image_id = data.yandex_compute_image.ubuntu-20-04.id
      size     = 40
    }
  }
  #   команда для установки до

  network_interface {
    # Указан id подсети default-ru-central1-a (не vps, а подсеть vps)
    subnet_id = var.subnet_id
    nat       = true
  }
  metadata = {
    ssh-keys = "${var.ssh_user}:${file(var.public_key_path)}"
  }
  connection {
    type        = "ssh"
    host        = self.network_interface.0.nat_ip_address
    user        = var.ssh_user
    agent       = false
    private_key = file(var.private_key_path)
  }
  #    подключение провизионера в удаленнйо машине
  provisioner "remote-exec" {
    #        выполнение команды
    inline = [
      "sudo apt update",
      "sudo apt install python3 -y",
    ]
    #   подключение к созданной машине
  }
  provisioner "local-exec" {
    #      подключение провизионера из машины в которой был запуск terraform
    command = "ansible-playbook -u ${var.ssh_user} -i '${self.network_interface.0.nat_ip_address},' --private-key ${var.private_key_path} ../ansible/playbooks/install-master.yml --ssh-common-args='-o StrictHostKeyChecking=no'"
  }


  # пример передачи файла на созданную машину
  #  provisioner "file" {
  #    source      = "script.sh"
  #    destination = "/tmp/script.sh"
  #  }

}
