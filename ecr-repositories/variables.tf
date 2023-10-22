variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit','XYZ')`)"
}

variable "repository_names" {
  type        = list(string)
  description = "names of repositories to create"
  default     = []
}

variable "allowed_account_ids" {
  type        = list(string)
  description = "ids of AWS accounts which can pull images from the repositories."
  default     = []
}

variable "max_image_count" {
  type = number
}

variable "image_tag_mutability" {}

variable "scan_on_push" {
  type = bool
}

variable "policy_documents" {
  type    = list(string)
  default = []
}