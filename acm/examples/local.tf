locals {
  acm_data = {
    k8sd = {
      domain_name         = "futuresmoon.org"
      zone_id             = "Z07808331KILEPYGR069U"
      wait_for_validation = true

      subject_alternative_names = [
        "*.futuresmoon.org",
      ]
    },
  }

}
