import boto3

def lambda_handler(event, context):
    ec2_client = boto3.client('ec2')
    ec2 = boto3.resource('ec2', region_name='us-east-1')
    #Get Volumes Unattached
    volumes = ec2.volumes.filter(
        Filters=[{'Name': 'status', 'Values': ['available']}]
        )
    for volume in volumes:
        v = ec2.Volume(volume.id)
        print("Deleting Volume :{}, Size:{} GiB".format(v.id, v.size))
        v.delete()
    
