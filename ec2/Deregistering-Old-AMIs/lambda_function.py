import boto3

def lambda_handler(event, context):
    ec2 = boto3.client('ec2', region_name='us-east-1')
    images = ec2.describe_images(Owners=['self'])['Images']['CreationDate']
    for image in images:
        if 'x86_64' in image.architecture:
            print('hello')
        else:
            print('fuck you')
