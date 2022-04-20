aws iam create-role --role-name S3Transcribe --assume-role-policy-document \
'{"Version": "2012-10-17","Statement": [{ "Effect": "Allow", "Principal": {"Service": "lambda.amazonaws.com"}, "Action": "sts:AssumeRole"}]}'
curl https://raw.githubusercontent.com/aissa-laribi/awsops/main/S3/Transcribing-Audio/iam.json > iam.json
aws iam create-policy --policy-name S3Transcribe --policy-document file://iam.json
aws iam put-role-policy --role-name S3Transcribe --policy-name S3Transcribe --policy-document file://iam.json
