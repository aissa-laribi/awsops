curl https://raw.githubusercontent.com/aissa-laribi/awsops/main/ec2/Stop-EC2-Instances-Nightly/role-permissions.json > iam.json
aws iam create-policy --policy-name LambdaEC2StartStop --policy-document file://iam.json