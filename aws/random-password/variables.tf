variable "enabled" {
  type    = bool
  default = false
}

variable "enable_special_characters" {
  type        = bool
  description = "Enables special characters in your password."
  default     = true
}

variable "length" {
  type        = number
  description = "Specifies the length of your password."
  default     = 16
}

variable "override_special" {
  default = "!#$%&*()-_=+[]{}<>:?"
}

variable "lower" {
  type    = bool
  default = true
}

variable "upper" {
  type    = bool
  default = true
}

variable "numeric" {
  type    = bool
  default = true
}
