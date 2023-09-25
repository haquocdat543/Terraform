
# Configure the AWS provider
provider "aws" {
  region = "us-east-1"  # Specify your desired AWS region
  access_key = var.access_key
  secret_key = var.secret_key
}

#1 Create an IAM user
resource "aws_iam_user" "example_user" {
  name = "example-user"
}

#2 Create an IAM policy
resource "aws_iam_policy" "example_policy" {
  name        = "example-policy"
  description = "An example IAM policy"
  
  # Define the policy document in JSON format
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = "s3:*",
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}

#3 Attach the policy to the IAM user
resource "aws_iam_user_policy_attachment" "example_attachment" {
  policy_arn = aws_iam_policy.example_policy.arn
  user       = aws_iam_user.example_user.name
}

#4 Create an IAM role
resource "aws_iam_role" "example_role" {
  name = "example-role"
  
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

#5 Attach the IAM policy to the IAM role
resource "aws_iam_policy_attachment" "example_attachment" {
  policy_arn = aws_iam_policy.example_policy.arn
  roles      = [aws_iam_role.example_role.name]
}

#6 Create an IAM group
resource "aws_iam_group" "example_group" {
  name = "example-group"
}

#7 Add IAM users to the group
resource "aws_iam_group_membership" "user1_membership" {
  name  = "user1-membership"
  users = [aws_iam_user.example_user.name]
  group = aws_iam_group.example_group.name
}

#8 Attach the policy to the IAM group
resource "aws_iam_policy_attachment" "example_attachment" {
  name       = "example-attachment"
  policy_arn = aws_iam_policy.example_policy.arn
  groups     = [aws_iam_group.example_group.name]
}

#9 Create an IAM access key for the user
resource "aws_iam_access_key" "example_access_key" {
  user = aws_iam_user.example_user.name
}

#10 Output the access key ID and secret
output "access_key_id" {
  value = aws_iam_access_key.example_access_key.id
}

output "secret_access_key" {
  value = aws_iam_access_key.example_access_key.secret
}

#11 Create an AWS Organization
resource "aws_organizations_organization" "example_organization" {
  feature_set = "ALL"
}

#12 Create a Service Control Policy (SCP)
resource "aws_organizations_policy" "example_scp" {
  name        = "Example-SCP"
  description = "An example Service Control Policy"
  content = <<-POLICY
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Deny",
        "Action": "*",
        "Resource": "*"
      }
    ]
  }
  POLICY
}

#13 Attach the SCP to the root of the organization
resource "aws_organizations_policy_attachment" "example_attachment" {
  policy_id     = aws_organizations_policy.example_scp.id
  target_id     = aws_organizations_organization.example_organization.roots[0].id
  target_type   = "ROOT"
}

#14 Optionally, you can create and attach SCPs to organizational units (OUs)
resource "aws_organizations_organizational_unit" "example_ou" {
  name          = "Example-OU"
  parent_id     = aws_organizations_organization.example_organization.roots[0].id
}

#15 Attach SCP to OU
resource "aws_organizations_policy_attachment" "ou_attachment" {
  policy_id     = aws_organizations_policy.example_scp.id
  target_id     = aws_organizations_organizational_unit.example_ou.id
  target_type   = "ORGANIZATIONAL_UNIT"
}


