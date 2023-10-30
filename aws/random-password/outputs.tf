output "password" {
  description = "The password is:"
  value       = random_password.password[0].result
  sensitive   = true
}