aws iam create-role --role-name LambdaEC2StartStop --assume-role-policy-document \
'{"Version": "2012-10-17","Statement": [{ "Effect": "Allow", "Principal": {"Service": "lambda.amazonaws.com"}, "Action": "sts:AssumeRole"}]}'
curl https://raw.githubusercontent.com/aissa-laribi/awsops/main/ec2/Stop-EC2-Instances-Nightly/role-permissions.json > iam.json
aws iam create-policy --policy-name LambdaEC2StartStop --policy-document file://iam.json
aws iam put-role-policy --role-name LambdaEC2StartStop --policy-name LambdaEC2StartStop --policy-document iam.json