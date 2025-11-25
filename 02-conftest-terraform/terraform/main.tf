terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# GOOD S3 bucket (should pass)
resource "aws_s3_bucket" "good_bucket" {
  bucket = "my-good-bucket-example"
  acl    = "private"
}

# BAD S3 bucket (should trigger Conftest)
resource "aws_s3_bucket" "public_bucket" {
  bucket = "my-public-bucket-example"
  acl    = "public-read"
}

# BAD EBS volume (unencrypted)
resource "aws_ebs_volume" "unencrypted" {
  availability_zone = var.az
  size              = 8
  encrypted         = false
}

# BAD IAM policy (uses wildcard *)
resource "aws_iam_policy" "wildcard_policy" {
  name        = "my-wildcard-policy"
  description = "Example IAM policy with wildcard"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = "*"
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}
