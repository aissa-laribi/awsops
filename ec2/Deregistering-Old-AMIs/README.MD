Lambda Function to Back Up EC2 Instances Daily
======

## Purpose

Remove Old AMIs automatically 

## Usage

## 1) Create a role and attach the policy to the Lambda Function 
If help needed check the commands on how to create a role 
quickly check Deregistering-Old-AMIs/helpers/create-role.sh
## 2) Create the DeleteOldAMIs Lambda function 
by using the Deregistering-Old-AMIs/lambda-function.py or Deregistering-Old-AMIs/lambda-function.zip, if help needed
on how to create and deploy quickly the Lambda Function check 
Deregistering-Old-AMIs/helpers/create-lambda.sh
## 3 Create the Event Rule
Set a schedule and add the Lambda function as a target, if help needed
on how to create and deploy quickly the Event Rule check
Deregistering-Old-AMIs/helpers/create-event-rule.sh
## 4 Add the Event Rule as a Trigger in Lambda
Go to the Console, and add the Event Rule as a trigger for the Lambda function.
Unfortunately, it's the only task I haven't managed to do from the AWS CLI
If ever, you have a solution, feel free to pull a request :)
