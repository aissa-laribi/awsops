Lambda Function to Back Up EC2 Instances Daily
======

## Purpose

Backing up Daily EC2 Instances and trying an alternative to the Snapshot Lifecycle Policy

## Usage

# 1) Create a role and attach the policy for the function 
if help needed check the commands on how to create a the role 
quickly check /helpers/create-role.sh
# 2) Create the Lambda function 
by using the lambda-function.py or lambda-function.zip, if needing help
on how to create and deploy quickly the Lambda Function check 
/helpers/create-role.sh
# 3 Create the Event Rule
Set a schedule and add the Lambda function as a target, if needing help
on how to create and deploy quickly the Event Rule check
/helpers/create-event-rule.sh
# 4 Add the Event Rule as a Trigger in Lambda
Go to the Console, and add the Event Rule as a trigger for the Lambda function.
Unfortunately, it's the only task I haven't managed to do it from the AWS CLI
If ever, you have a solution, feel free to pull a request :)
# 5 Create a Prune Lambda Function To Remove All The Unecessary Snapshots    
