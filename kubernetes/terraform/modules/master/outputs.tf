output "external_ip_address_master" {
#  * звездочка ставится для вывода все ip адресов
  value = yandex_compute_instance.master.network_interface[0].nat_ip_address

}
output "name" {
#  * звездочка ставится для вывода все ip адресов
  value = yandex_compute_instance.master.name

}
