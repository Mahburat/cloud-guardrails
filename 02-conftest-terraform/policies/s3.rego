package terraform.s3

deny[msg] {
  input.resource_type == "aws_s3_bucket"
  input.values.acl == "public-read"
  msg := "S3 bucket must not be public!"
}
