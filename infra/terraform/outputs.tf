output "external_ip_address_node" {
#  * звездочка ставится для вывода все ip адресов
  value = yandex_compute_instance.node[*].network_interface[0].nat_ip_address
}
