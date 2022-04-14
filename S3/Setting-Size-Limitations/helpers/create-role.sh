aws iam create-role --role-name S3SizeLimiter --assume-role-policy-document \
'{"Version": "2012-10-17","Statement": [{ "Effect": "Allow", "Principal": {"Service": "lambda.amazonaws.com"}, "Action": "sts:AssumeRole"}]}'
curl https://raw.githubusercontent.com/aissa-laribi/awsops/main/S3/Setting-Size-Limitations/iam.json > iam.json
aws iam create-policy --policy-name S3SizeLimiter --policy-document file://iam.json
aws iam put-role-policy --role-name S3SizeLimiter --policy-name S3SizeLimiter --policy-document file://iam.json

