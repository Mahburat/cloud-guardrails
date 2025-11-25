package terraform.ebs

deny[msg] {
  input.resource_type == "aws_ebs_volume"
  input.values.encrypted == false
  msg := "EBS volume must be encrypted!"
}
