#!/bin/bash

set -euo pipefail

echo "🚀 Initializing Terraform..."
cd terraform
terraform init -input=false > /dev/null

echo "📦 Generating Terraform plan..."
terraform plan -out=tfplan -input=false > /dev/null

echo "🧩 Converting Terraform plan to JSON..."
terraform show -json tfplan > tfplan.json

echo "🔎 Running Conftest checks..."
conftest test tfplan.json --policy ../policies

echo "✅ Conftest check completed!"
