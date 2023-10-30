locals {
  allowed_account_ids = flatten(concat(var.aws_iam_root_account_id))
  p_id                = formatlist("arn:aws:iam::%s:root", local.allowed_account_ids)
}

data "aws_iam_policy_document" "terraform_assume_role_policy" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "AWS"
      identifiers = formatlist("arn:aws:iam::%s:root", var.aws_iam_root_account_id)

    }
  }
}


data "aws_iam_policy_document" "base" {
  statement {
    effect = "Allow"

    actions = [
      "support:*",
      "aws-portal:View*",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    effect = "Allow"

    actions = [
      "kms:Encrypt",
      "acm:RequestCertificate",
      "cloudwatch:DisableAlarmActions",
      "cloudwatch:EnableAlarmActions",
      "ecr:GetAuthorizationToken",
      "ecr:BatchCheckLayerAvailability",
      "ecr:BatchGetImage",
      "ecr:CompleteLayerUpload",
      "ecr:DescribeImages",
      "ecr:DescribeRepositories",
      "ecr:GetDownloadUrlForLayer",
      "ecr:GetRepositoryPolicy",
      "ecr:InitiateLayerUpload",
      "ecr:ListImages",
      "ecr:PutImage",
      "ecr:UploadLayerPart",
    ]

    resources = [
      "*",
    ]
  }

}

data "aws_iam_policy_document" "allow_all" {
  statement {
    effect = "Allow"

    actions = [
      "*",
    ]

    resources = [
      "*",
    ]
  }
}

