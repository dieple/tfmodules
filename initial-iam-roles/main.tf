resource "aws_iam_role" "terraform" {
  name               = var.role_name_terraform
  assume_role_policy = data.aws_iam_policy_document.terraform_assume_role_policy.json
}

resource "aws_iam_policy" "base" {
  name   = "base"
  policy = data.aws_iam_policy_document.base.json
}

resource "aws_iam_policy_attachment" "base" {
  name = "base"
  roles = [
    aws_iam_role.terraform.name,
  ]
  policy_arn = aws_iam_policy.base.arn
}

resource "aws_iam_policy" "allow_all" {
  name   = "allow_all"
  policy = data.aws_iam_policy_document.allow_all.json
}

resource "aws_iam_policy_attachment" "terraform_access" {
  name  = format("%s-%s", var.role_name_terraform, "access")
  roles = [aws_iam_role.terraform.name]

  policy_arn = var.override_terraform_policy == false ? aws_iam_policy.allow_all.arn : var.override_terraform_policy_arn
  depends_on = [aws_iam_role.terraform]
}

// custom policy attachment for roles
resource "aws_iam_policy_attachment" "terraform" {
  count = var.override_terraform_role_policy == false ? 0 : 1
  name  = var.role_name_terraform
  roles = [
    aws_iam_role.terraform.name,
  ]
  policy_arn = var.override_terraform_role_policy_arn
}
