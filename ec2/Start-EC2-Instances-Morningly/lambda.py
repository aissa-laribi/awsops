import boto3

def lambda_handler(event, context):

    ec2 = boto3.resource('ec2', region_name='us-east-1')
    instances = ec2.instances.filter(
        Filters=[{'Name': 'instance-state-name',
                      'Values': ['stopped']}])
    for instance in instances:
        print('Stopped instance: ', instance.id)
        instance.start()
        print('Started instance: ', instance.id)
