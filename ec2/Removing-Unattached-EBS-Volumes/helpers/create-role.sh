aws iam create-role --role-name RemoveEBS --assume-role-policy-document \
'{"Version": "2012-10-17","Statement": [{ "Effect": "Allow", "Principal": {"Service": "lambda.amazonaws.com"}, "Action": "sts:AssumeRole"}]}'
curl https://raw.githubusercontent.com/aissa-laribi/awsops/main/ec2/Removing-Unattached-EBS-volumes/iam.json > iam.json
aws iam create-policy --policy-name RemoveEBS --policy-document file://iam.json
aws iam put-role-policy --role-name RemoveEBS --policy-name RemoveEBS --policy-document file://iam.json
