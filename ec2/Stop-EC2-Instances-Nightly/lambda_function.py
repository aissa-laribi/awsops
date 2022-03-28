import boto3

def lambda_handler(event, context):

    ec2 = boto3.resource('ec2', region_name='Enter_Region_Name')
    instances = ec2.instances.filter(
        Filters=[{'Name': 'instance-state-name',
                      'Values': ['running']}])
    for instance in instances:
        print('Running instance: ', instance.id)
        instance.stop()
        print('Stopped instance: ', instance.id)
