import boto3

transcribe = boto3.client('transcribe')
s3 = boto3.client('s3')


def lambda_handler(event, context):
    for record in event['Records']:
        bucket = record['s3']['bucket']['name']
        key = record['s3']['object']['key']
        region = record['awsRegion']
        object_url = "https://{0}.s3.{1}.amazonaws.com/{2}".format(
            bucket, region, key)
        print(object_url)

        response = transcribe.start_transcription_job(
            TranscriptionJobName='Transcribe-{}'.format(key), 
            LanguageCode= 'en-US', 
            Media={'MediaFileUri': str(object_url)}, 
            MediaFormat='mp3',
            OutputBucketName=str(bucket),
            OutputKey='{}transcribed.json'.format(key))
        
        print(response)