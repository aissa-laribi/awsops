aws iam create-role --role-name S3Translate --assume-role-policy-document \
'{"Version": "2012-10-17","Statement": [{ "Effect": "Allow", "Principal": {"Service": "lambda.amazonaws.com"}, "Action": "sts:AssumeRole"}]}'
curl https://raw.githubusercontent.com/aissa-laribi/awsops/main/S3/Translating-Text-Content/iam.json > iam.json
aws iam create-policy --policy-name S3Translate --policy-document file://iam.json
aws iam put-role-policy --role-name S3Translate --policy-name S3Transcribe --policy-document file://iam.json
