package terraform.iam

deny[msg] {
  input.resource_type == "aws_iam_policy"
  statement := input.values.policy_document.Statement[_]
  statement.Action == "*"
  msg := "IAM policy must not use wildcard '*' actions!"
}
