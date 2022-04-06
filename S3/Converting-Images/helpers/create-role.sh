aws iam create-role --role-name ConvertToWebp --assume-role-policy-document \
'{"Version": "2012-10-17","Statement": [{ "Effect": "Allow", "Principal": {"Service": "lambda.amazonaws.com"}, "Action": "sts:AssumeRole"}]}'
curl https://raw.githubusercontent.com/aissa-laribi/awsops/main/S3/Converting-Images/iam.json > iam.json
aws iam create-policy --policy-name ConvertToWebp --policy-document file://iam.json
aws iam put-role-policy --role-name ConvertToWebp --policy-name ConvertToWebp --policy-document file://iam.json

