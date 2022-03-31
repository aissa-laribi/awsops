curl https://raw.githubusercontent.com/aissa-laribi/awsops/main/ec2/Removing-Unattached-EBS-Volumes/mapping.json > mapping.json
aws ec2 modify-instance-attribute --instance-id <instance-ids> --block-device-mappings file://mapping.json
