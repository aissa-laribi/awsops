from datetime import datetime
import boto3

def lambda_handler(event, context):
    ec2 = boto3.resource('ec2', region_name='us-east-1')
    instances = ec2.instances.filter(
        Filters=[
            {'Name': 'tag:backup', 'Values': ['true']}
        ]
    )
    # ISO 8601 timestamp, i.e. 2022-03-30T14:01:58
    timestamp = datetime.utcnow().replace(microsecond=0).isoformat()

    for i in instances.all():
        for v in i.volumes.all():
            desc = 'Backup of {0}, volume {1}, created {2}'.format(
                i.id, v.id, timestamp)
            print(desc)

            snapshot = v.create_snapshot(Description=desc)

            print("Created snapshot:", snapshot.id)
