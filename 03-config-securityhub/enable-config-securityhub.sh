#!/bin/bash

set -e

ACCOUNT_ID=$(aws sts get-caller-identity --query "Account" --output text)
REGION=$(aws configure get region)

echo "Enabling AWS Config Recorder..."
aws configservice put-configuration-recorder \
  --configuration-recorder name=default,roleARN=arn:aws:iam::$ACCOUNT_ID:role/aws-service-role/config.amazonaws.com/AWSServiceRoleForConfig

echo "Starting Configuration Recorder..."
aws configservice start-configuration-recorder --configuration-recorder-name default

echo "Enabling SecurityHub..."
aws securityhub enable-security-hub

echo "SecurityHub Enabled!"
