variable "domain_name" {}
variable "validation_method" {}
variable "zone_id" {}

variable "ttl" {
  type = number
}

variable "allow_overwrite" {
  type = bool
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "sub_alt_names" {
  type = list(string)
}