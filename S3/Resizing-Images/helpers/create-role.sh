aws iam create-role --role-name Generate-Thumbnails --assume-role-policy-document \
'{"Version": "2012-10-17","Statement": [{ "Effect": "Allow", "Principal": {"Service": "lambda.amazonaws.com"}, "Action": "sts:AssumeRole"}]}'
curl https://raw.githubusercontent.com/aissa-laribi/awsops/main/S3/Resizing-Images/iam.json > iam.json
aws iam create-policy --policy-name Generate-Thumbnails --policy-document file://iam.json
aws iam put-role-policy --role-name Generate-Thumbnails --policy-name Generate-Thumbnails --policy-document file://iam.json

