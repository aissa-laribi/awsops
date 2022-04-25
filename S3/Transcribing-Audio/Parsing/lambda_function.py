import urllib.request
import json
import boto3

transcribe = boto3.client('transcribe')
s3 = boto3.client('s3')


def lambda_handler(event, context):
    bucket = record['s3']['bucket']['name']
    key = record['s3']['object']['key']
    region = record['awsRegion']
    object_url = "https://{0}.s3.{1}.amazonaws.com/{2}".format(
        bucket, region, key)
    print(object_url)
    data = urllib.request.urlopen(object_url).read().decode('UTF-8')
    content = json.loads(data)
    text = content['results']['transcripts'][0]['transcript']
    print(text)
    object = s3.Object(bucket, job_name + '.txt')
    object.put(Body=text)