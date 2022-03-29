
aws iam create-role --role-name LambdaEC2StopStart --assume-role-policy-document \
'{"Version": "2012-10-17","Statement": [{ "Effect": "Allow", "Principal": {"Service": "lambda.amazonaws.com"}, "Action": "sts:AssumeRole"}]}'
curl https://raw.githubusercontent.com/aissa-laribi/awsops/main/ec2/Start-EC2-Instances-Mornightly/role-permissions.json > iam.json
aws iam create-policy --policy-name LambdaEC2Start --policy-document file://iam.json
aws iam put-role-policy --role-name LambdaEC2Start --policy-name LambdaEC2Start --policy-document file://iam.json
