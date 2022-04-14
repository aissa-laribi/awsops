import boto3

s3 = boto3.client('s3')

def lambda_handler(event, context):
    for record in event['Records']:
        bucket = record['s3']['bucket']['name']
        key = record['s3']['object']['key']
        size = record['s3']['object']['size']
        if size >= 2000:
            s3.delete_object(
                Bucket= str(bucket),
                Key= str(key),
                )