resource "aws_iam_group" "wiz-sar-test-group-inline" {
  name = "wiz-sar-test-group-inline"
  path = "/"
}

resource "aws_iam_group" "wiz-sar-test-group-cmp" {
  name = "wiz-sar-test-group-cmp"
  path = "/"
}

resource "aws_iam_group_policy" "wiz-sar-test-group-inline-allow-all" {
  name = "wiz-sar-test-group-inline-allow-all"
  group = aws_iam_group.wiz-sar-test-group-inline.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_user" "wiz-sar-test-user-inline" {
  name = "wiz-sar-test-user-inline"
  path = "/"
}

resource "aws_iam_user" "wiz-sar-test-user-cmp" {
  name = "wiz-sar-test-user-cmp"
  path = "/"
}
resource "aws_iam_user_policy" "wiz-sar-test-user-inline-allow-all" {
  name = "wiz-sar-test-user-inline-allow-all"
  user = aws_iam_user.wiz-sar-test-user-inline.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role" "wiz-sar-test-role-inline" {
  name = "wiz-sar-test-role-inline"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role" "wiz-sar-test-role-cmp" {
  name = "wiz-sar-test-role-cmp"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}
resource "aws_iam_role_policy" "wiz-sar-test-role-inline-allow-all" {
  name = "wiz-sar-test-role-inline-allow-all"
  role = aws_iam_role.wiz-sar-test-role-inline.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_policy" "wiz-sar-test-full-access-cm-policy" {
  name        = "wiz-sar-test-full-access-cm-policy"
  path        = "/"
  description = "Customer managed policy with full access for Wiz SAR testing"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "wiz-sar-test-full-access-cm-policy-attach" {
  name       = "wiz-sar-test-full-access-cm-policy-attachment"
  groups     = [aws_iam_group.wiz-sar-test-group-cmp.name]
  users      = [aws_iam_user.wiz-sar-test-user-cmp.name]
  roles      = [aws_iam_role.wiz-sar-test-role-cmp.name]
  policy_arn = aws_iam_policy.wiz-sar-test-full-access-cm-policy.arn
}

