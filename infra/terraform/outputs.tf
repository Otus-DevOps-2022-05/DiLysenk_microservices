output "external_ip_address_vm-1" {
  value = yandex_compute_instance.vm-1.network_interface.nat_ip_address
}
