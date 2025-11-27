cloud-guardrails/
 ├─ README.md
 ├─ 01-eks-gatekeeper/
 │  ├─ install-gatekeeper.sh
 │  ├─ policies/
 │  │  ├─ ct-no-privileged-containers.yaml
 │  │  ├─ c-no-privileged-containers.yaml
 │  │  ├─ ct-require-runasnonroot.yaml
 │  │  ├─ c-require-runasnonroot.yaml
 │  │  ├─ ct-require-resources.yaml
 │  │  ├─ c-require-resources.yaml
 │  │  ├─ ct-disallow-hostpath.yaml
 │  │  ├─ c-disallow-hostpath.yaml
 │  └─ tests/
 │     
├─ bad-pod.yaml
 │     
└─ good-deployment.yaml
 ├─ 02-conftest-terraform/
 │  ├─ policies/
 │  │  ├─ s3.rego
 │  │  ├─ ebs.rego
 │  │  └─ iam.rego
 │  ├─ terraform/
 │  │  ├─ main.tf
 │  │  └─ variables.tf
 │  └─ run.sh
 ├─ 03-config-securityhub/
 │  ├─ enable-config-securityhub.sh
 │  └─ verify-findings.sh                                                                                                                                                                                               ├─ 04-auto-remediation/
 │  ├─ eventbridge-rule.json
 │  ├─ lambda_s3_public_block/handler.py
 │  ├─ lambda_s3_public_block/policy.json
 │  └─ deploy.sh
 └─ .github/
 └─ workflows/
 └─ policy-checks.yml
