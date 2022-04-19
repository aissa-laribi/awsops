import csv
import os
import tempfile
import boto3


dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('<TABLENAME>')
s3 = boto3.client('s3')


def lambda_handler(event, context):
    for record in event['Records']:
        bucket = record['s3']['bucket']['name']
        key = record['s3']['object']['key']
        with tempfile.TemporaryDirectory() as tmpdir:
            download_path = os.path.join(tmpdir,'key')
            s3.download_file(bucket, key, download_path)
            items = read_csv(download_path)

            with table.batch_writer() as batch:
                for item in items:
                    batch.put_item(Item=item)

def read_csv(file):
    items=[]
    with open(file) as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            data = {}
            data['Meta'] = {}
            data['Date'] = row['Date']
            data['Competition'] = row['Competition']
            data['Time(GMT+2)'] = row['Time(GMT+2)']
            data['Meta']['Home-Team'] = row[' Home-Team']
            data['Meta']['Score'] = row[' Score']
            data['Meta']['Away-Team'] = row[' Away-Team']
            items.append(data)
    return items
