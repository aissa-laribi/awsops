aws iam create-role --role-name CSVTODYNAMODB --assume-role-policy-document \
'{"Version": "2012-10-17","Statement": [{ "Effect": "Allow", "Principal": {"Service": "lambda.amazonaws.com"}, "Action": "sts:AssumeRole"}]}'
curl https://raw.githubusercontent.com/aissa-laribi/awsops/main/S3/Converting-CSV-To-Json-To-DynamoDB/iam.json > iam.json
aws iam create-policy --policy-name CSVTODYNAMODB --policy-document file://iam.json
aws iam put-role-policy --role-name CSVTODYNAMODB --policy-name CSVTODYNAMODB --policy-document file://iam.json
