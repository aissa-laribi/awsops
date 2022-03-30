Lambda Function to Back Up EC2 Instances Daily
======

## Purpose

Backing up Daily EC2 Instances and trying an alternative to the Snapshot Lifecycle Policy

## Usage

# 1) Create a role and attach the policy for the functions 
if help needed check the commands on how to create a the role 
quickly check Create-Snapshots/helpers/create-role.sh
# 2) Create the Create Snapshots Lambda function 
by using the Create-Snapshots/lambda-function.py or Create-Snapshot/lambda-function.zip, if help needed
on how to create and deploy quickly the Lambda Function check 
Create-Snapshots/helpers/create-lambda.sh
# 3 Create the Event Rule
Set a schedule and add the Lambda function as a target, if help needed
on how to create and deploy quickly the Event Rule check
Create-Snapshots/helpers/create-event-rule.sh
# 4 Add the Event Rule as a Trigger in Lambda
Go to the Console, and add the Event Rule as a trigger for the Lambda function.
Unfortunately, it's the only task I haven't managed to do from the AWS CLI
If ever, you have a solution, feel free to pull a request :)
# 5 Create a Prune-Snapshots Lambda Function To Remove All The Unnecessary Snapshots
by using the Prune-Snapshots/lambda-function.py or Prune-Snapshots/lambda-function.zip 
and assign the same role as the Create-Snapshot/lambda-function.py or 
Create-Snapshot/lambda-function.zip, if help needed on how to create and 
deploy quickly the Prune-Snapshots Lambda Function 
check Prune-Snapshots/helpers/create-lambda.sh
# 6 Create the Event Rule for the Prune-Snapshots
Set a schedule and add the Prune-Snapshots Lambda function as a target, if help needed
on how to create and deploy quickly the Event Rule check
Prune-Snapshots/helpers/create-event-rule.sh
# 7 Add the Event Rule as a Trigger in Lambda
Go to the Console, and add the Event Rule as a trigger for the Prune-Snapshots Lambda function.
Unfortunately, it's the only task I haven't managed to do from the AWS CLI
If ever, you have a solution, feel free to pull a request :)