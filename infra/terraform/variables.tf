variable "service_account_key_file" {
  description = "экспорт файла = key.json yc iam key create --service-account-id $ACCT_ID --output <свой путь>/key.json"
}

variable "cloud_id" {
  description = "cloud_id индентификатор yc облака"
}
variable "folder_id" {
  description = "folder_id каталог в yc"
}
variable "zone" {
  description = "zone"
  default     = "ru-central1-a"
}

variable "public_key_path" {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable "disk_id" {
  description = "Disk image id default ubuntu 16 lts"
  default     = "fd87k1od4v1bth3m59ha"
}
variable "subnet_id" {
  description = "subnet for vm in yandex cloud"
  default     = "enplkgfj4bjhhhd827dg"
}
