variable "service_account_key_file" {
  description = "IAM key и экспортируйте его в файл. = key.json yc iam key create --service-account-id $ACCT_ID --output <свой путь>/key.json"
}

variable cloud_id { description = "cloud_id индентификатор yc облака" }
variable folder_id { description = "folder_id каталог в yc" }
variable zone { description = "zone" default = "ru-central1-a" }
