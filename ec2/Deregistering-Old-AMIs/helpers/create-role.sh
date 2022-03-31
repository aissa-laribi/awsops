aws iam create-role --role-name LambdaDeleteOldAMIs --assume-role-policy-document \
'{"Version": "2012-10-17","Statement": [{ "Effect": "Allow", "Principal": {"Service": "lambda.amazonaws.com"}, "Action": "sts:AssumeRole"}]}'
curl https://raw.githubusercontent.com/aissa-laribi/awsops/main/ec2/Deregistering-Old-AMIs/role-permissions.json > iam.json
aws iam create-policy --policy-name LambdaDeleteOldAMIs --policy-document file://iam.json
aws iam put-role-policy --role-name LambdaDeleteOldAMIs --policy-name LambdaDeleteOldAMIs --policy-document file://iam.json
