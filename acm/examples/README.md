# Note

```bash
cd terraform/main/management/acm
terraform workspace new k8sd || terraform workspace select k8sd
terraform init
terraform plan
terraform apply
```

### Outputs
```bash
Outputs:

acm_certificate_arn = "arn:aws:acm:eu-west-1:372940082211:certificate/2bf5598e-e0e5-4a19-82ee-20982d93f491"
acm_certificate_domain_validation_options = [
  {
    "domain_name" = "*.futuresmoon.org"
    "resource_record_name" = "_804d09e2d409453209bccf46babc81ff.futuresmoon.org."
    "resource_record_type" = "CNAME"
    "resource_record_value" = "_67ba0a1e19c5e9c63c07057957c3c0a3.ylqxxscwpq.acm-validations.aws."
  },
  {
    "domain_name" = "futuresmoon.org"
    "resource_record_name" = "_804d09e2d409453209bccf46babc81ff.futuresmoon.org."
    "resource_record_type" = "CNAME"
    "resource_record_value" = "_67ba0a1e19c5e9c63c07057957c3c0a3.ylqxxscwpq.acm-validations.aws."
  },
]
acm_certificate_validation_emails = []
distinct_domain_names = tolist([
  "futuresmoon.org",
])
validation_domains = tolist([
  {
    "domain_name" = "futuresmoon.org"
    "resource_record_name" = "_804d09e2d409453209bccf46babc81ff.futuresmoon.org."
    "resource_record_type" = "CNAME"
    "resource_record_value" = "_67ba0a1e19c5e9c63c07057957c3c0a3.ylqxxscwpq.acm-validations.aws."
  },
])
validation_route53_record_fqdns = [
  "_804d09e2d409453209bccf46babc81ff.futuresmoon.org",
]

```
