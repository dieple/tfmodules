output "certificate_id" {
  value = aws_acm_certificate.default.id
}

output "certificate_arn" {
  value = aws_acm_certificate.default.arn
}

output "certificate_domain_name" {
  value = aws_acm_certificate.default.domain_name
}

output "validation_emails" {
  value = aws_acm_certificate.default.validation_emails
}
