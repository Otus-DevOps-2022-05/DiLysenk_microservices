variable "public_key_path" {
  # Описание переменной
  description = "Path to the public key used for ssh access ~/.ssh/id_ed25519.pub"
}

variable "subnet_id" {
  description = "subnet for vm in yandex cloud"
  default     = "enplkgfj4bjhhhd827dg"
}

variable "name" {
  description = "name machine"
  default     = "onetwo"
}

variable "instance_count" {
  description = "instance_count"
  default     = "1"
}

variable "ssh_user" {
  description = "name of user"
  default     = "user"
}

variable "private_key_path" {
  description = "private key ~/.ssh/id_ed25519"
}
