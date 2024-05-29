module "tag_label" {
  source      = "../../../../generic-modules/core/tagging"
  environment = terraform.workspace
  attributes  = ["acm"]
}

module "acm" {
  source                    = "terraform-aws-modules/acm/aws"
  version                   = "~> 3.0"
  domain_name               = lookup(local.acm_data[terraform.workspace], "domain_name")
  zone_id                   = lookup(local.acm_data[terraform.workspace], "zone_id")
  subject_alternative_names = lookup(local.acm_data[terraform.workspace], "subject_alternative_names")
  wait_for_validation       = lookup(local.acm_data[terraform.workspace], "wait_for_validation")
  tags                      = module.tag_label.tags
}