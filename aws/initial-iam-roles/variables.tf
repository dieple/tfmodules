variable "aws_iam_root_account_id" {
  type = list(string)
}

variable "override_terraform_policy" {
  type    = bool
  default = false
}

variable "override_terraform_policy_arn" {
  type    = string
  default = ""
}

variable "override_terraform_role_policy" {
  type    = bool
  default = false
}

variable "override_terraform_role_policy_arn" {
  type    = string
  default = ""
}

variable "role_name_terraform" {}

