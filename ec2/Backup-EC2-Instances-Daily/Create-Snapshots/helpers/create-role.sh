aws iam create-role --role-name EC2Backup --assume-role-policy-document \
'{"Version": "2012-10-17","Statement": [{ "Effect": "Allow", "Principal": {"Service": "lambda.amazonaws.com"}, "Action": "sts:AssumeRole"}]}'
curl https://raw.githubusercontent.com/aissa-laribi/awsops/main/ec2/Backup-EC2-Instances-Daily/Create-Snapshots/iam.json > iam.json
aws iam create-policy --policy-name EC2Backup --policy-document file://iam.json
aws iam put-role-policy --role-name EC2Backup --policy-name EC2Backup --policy-document file://iam.json
