import os
import tempfile
import boto3
from wand.image import Image

s3 = boto3.client('s3')
s3r = boto3.resource('s3')


def lambda_handler(event, context):

    for record in event['Records']:
        source_bucket = record['s3']['bucket']['name']
        key = record['s3']['object']['key']
        convert = 'convert-' + key
        with tempfile.TemporaryDirectory() as tmpdir:
            download_path = os.path.join(tmpdir, key)
            upload_path = os.path.join(tmpdir, convert)
            s3r.meta.client.download_file(str(source_bucket), str(key), str(download_path))
            convert_to_webp(download_path, upload_path)
            dest_path = s3.upload_file(str(upload_path), 'dest-lslslsls', str(convert))

        print('Converted image saved at dest-lslslsls/{}'.format(convert))


def convert_to_webp(source_path, dest_path):
    print('Converting image from:', source_path)
    with Image(filename=source_path) as image:
        image.convert('webp')
        image.save(filename=dest_path+'webp')