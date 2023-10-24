resource "aws_ecr_repository" "repository" {
  for_each = toset(var.repository_names)

  name                 = each.value
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = var.tags
}

resource "aws_ecr_repository_policy" "policy" {
  for_each = toset(var.repository_names)

  repository = each.value
  policy     = var.registry_policy
  depends_on = [aws_ecr_repository.repository]
}

resource "aws_ecr_lifecycle_policy" "policy" {
  for_each = toset(var.repository_names)

  repository = each.value

  policy = <<EOF
  {
     "rules":[
        {
           "rulePriority": 1,
           "description": "Remove untagged images",
           "selection": {
              "tagStatus": "untagged",
              "countType": "imageCountMoreThan",
              "countNumber": 1
           },
           "action": {
              "type": "expire"
           }
        },
        {
            "rulePriority": 2,
            "description": "Keep last 30 images",
            "selection": {
                "tagStatus": "tagged",
                "tagPrefixList": ["v"],
                "countType": "imageCountMoreThan",
                "countNumber": ${var.max_image_count}
            },
            "action": {
                "type": "expire"
            }
        },
        {
           "rulePriority": 3,
           "description": "Rotate images when reach ${var.max_image_count} images stored",
           "selection": {
              "tagStatus": "any",
              "countType": "imageCountMoreThan",
              "countNumber": ${var.max_image_count}
           },
           "action":{
              "type":"expire"
           }
        }
     ]
  }
EOF

  depends_on = [aws_ecr_repository.repository]
}

