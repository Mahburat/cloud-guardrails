import boto3

def lambda_handler(event, context):
    s3 = boto3.client('s3')

    bucket_name = event["detail"]["resourceId"]

    print(f"Blocking public access for bucket: {bucket_name}")

    s3.put_public_access_block(
        Bucket=bucket_name,
        PublicAccessBlockConfiguration={
            "BlockPublicAcls": True,
            "IgnorePublicAcls": True,
            "BlockPublicPolicy": True,
            "RestrictPublicBuckets": True
        }
    )

    return {"status": "success", "bucket": bucket_name}
