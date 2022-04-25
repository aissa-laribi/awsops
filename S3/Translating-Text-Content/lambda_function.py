import boto3

translate = boto3.client('translate')
s3 = boto3.resource('s3')
s3client = boto3.client('s3') 


def lambda_handler(event, context):
    for record in event['Records']:
        bucket = record['s3']['bucket']['name']
        key = record['s3']['object']['key']
        obj = s3.Object(bucket, key)
        txt = obj.get()['Body'].read().decode('utf-8') 

        response = translate.translate_text(
            Text=str(txt),
            SourceLanguageCode='en',
            TargetLanguageCode='fr'
            )
        
    print(response)