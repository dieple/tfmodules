resource "aws_acm_certificate" "default" {
  domain_name               = var.domain_name
  validation_method         = var.validation_method
  subject_alternative_names = var.sub_alt_names
  tags                      = var.tags

  lifecycle {
    create_before_destroy = true
  }
}

//https://github.com/hashicorp/terraform-provider-aws/issues/8531
resource "aws_route53_record" "default" {
  for_each = {
    for dvo in aws_acm_certificate.default.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }
  allow_overwrite = var.allow_overwrite
  name            = each.value.name
  records         = [each.value.record]
  ttl             = var.ttl
  type            = each.value.type
  zone_id         = var.zone_id
}

resource "aws_acm_certificate_validation" "default" {
  certificate_arn         = aws_acm_certificate.default.arn
  validation_record_fqdns = [for record in aws_route53_record.default : record.fqdn]
}
