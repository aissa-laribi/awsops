Lambda Function to Start All EC2 Instances in a Region Nightly    
========

## Purpose

Starting all stopped instances by a function similar to https://github.com/aissa-laribi/awsops/tree/main/ec2/Stop-EC2-Instances-Nightly

## Usage

Alongside the Lambda function, and the role permissions supplied in this repository,
create a CloudWatch Event Rule with a Cron expression 

Cron expression: 0 8 ? * MON-FRI *

Monday to Friday, everyday at 8am Local Time
