output "external_ip_address_worker" {
#  * звездочка ставится для вывода все ip адресов
  value = yandex_compute_instance.worker[*].network_interface[0].nat_ip_address
}

output "name" {
#  * звездочка ставится для вывода все ip адресов
  value = yandex_compute_instance.worker[*].name

}
