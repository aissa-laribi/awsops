import os
import tempfile
import boto3
from cmagick import cmagick


s3 = boto3.client('s3')
s3r = boto3.resource('s3')
s3r = boto3.resource('s3')


def lambda_handler(event, context):

    for record in event['Records']:
        source_bucket = record['s3']['bucket']['name']
        key = record['s3']['object']['key']
        convert = key + '.webp'
        with tempfile.TemporaryDirectory() as tmpdir:
            download_path = os.path.join(tmpdir, key)
            upload_path = os.path.join(tmpdir, convert)
            s3r.meta.client.download_file(
                str(source_bucket), str(key), str(download_path)
                )
            cmagick.convert(download_path, upload_path)
            s3r.meta.client.upload_file(str(upload_path), '<DESTINATION-BUCKET>', str(convert))
