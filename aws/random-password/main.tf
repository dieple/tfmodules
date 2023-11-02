resource "random_password" "password" {
  count            = var.enabled ? 1 : 0
  length           = var.length
  special          = var.enable_special_characters
  override_special = var.override_special
  lower            = var.lower
  upper            = var.upper
  numeric          = var.numeric
}