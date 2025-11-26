#!/bin/bash

set -e

LAMBDA_NAME="s3-public-block-lambda"
ZIP_FILE="lambda.zip"

cd lambda_s3_public_block

zip -r ../$ZIP_FILE .

aws lambda create-function \
  --function-name $LAMBDA_NAME \
  --runtime python3.9 \
  --handler handler.lambda_handler \
  --zip-file fileb://../$ZIP_FILE \
  --role arn:aws:iam::$(aws sts get-caller-identity --query Account --output text):role/LambdaExecutionRole
