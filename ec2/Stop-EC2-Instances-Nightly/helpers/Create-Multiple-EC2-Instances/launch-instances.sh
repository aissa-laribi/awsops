aws ec2 create-key-pair --key-name KeyName --query 'KeyMaterial' --output text> KeyName.pem
sudo chmod 400 KeyName.pem
aws ec2 describe-security-groups
#copy security-group-ids
#Recent Linux ami IDs
#Amazon Linux 2 AMI (HVM) - Kernel 5.10, SSD Volume Type - ami-0a8b4cd432b1c3063 (64-bit x86) / ami-0b6705f88b1f688c1 (64-bit Arm)
#Amazon Linux 2 AMI (HVM) - Kernel 4.14, SSD Volume Type - ami-01893222c83843146 (64-bit x86) / ami-0f6ef8dcbf23a4dc1 (64-bit Arm)
aws ec2 run-instances --region <region-name> --image-id ami-0a8b4cd432b1c3063 --instance-type t2.micro --security-group-ids <sg-id> --key-name KeyName
sleep 10
aws ec2 run-instances --region <region-name> --image-id ami-0a8b4cd432b1c3063 --instance-type t2.micro --security-group-ids <sg-id> --key-name KeyName
sleep 10
aws ec2 run-instances --region <region-name> --image-id ami-0a8b4cd432b1c3063 --instance-type t2.micro --security-group-ids <sg-id> --key-name KeyName
sleep 10
