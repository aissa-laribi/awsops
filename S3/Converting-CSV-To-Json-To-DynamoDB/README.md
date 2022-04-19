# Lambda Function to Convert a CSV File To JSON and Saving It To DynamoDB

## Purpose

Saving automatically csv files to DynamoDB from an S3 Bucket

## Usage

## 1) Create a Dynamo Table
As shown in Converting-CSV-To-Json-To-DynamoDB/helpers/create-dynamo-table.sh
## 2) Create a role and attach the policy for the Lambda function 
if help needed check the commands on how to create a role quickly 
check Converting-CSV-To-Json-To-DynamoDB/helpers/create-role.sh.
### The Role needs the permissions described in the policy Converting-CSV-To-Json-To-DynamoDB/iam.json
### And Replace <YOUR-BUCKET> with the name of your respective bucket
## 3) Write the Lambda function
by using the Converting-CSV-To-Json-To-DynamoDB/lambda-function.py 
### Replace in line 8 <TABLENAME> with the name of your DynamoDB Table 2000 if you want to define a different limit.

## 4 Upload the Lambda function 
Use the Converting-CSV-To-Json-To-DynamoDB/helpers/create-function.sh file to upload the function
alongside the CSVTODYNAMODB Role 

## 5 Add the S3 Source Bucket as Trigger in Lambda
Go to the Console, and add the S3 Source Bucket and a trigger for the Lambda function.
### And add the suffix .csv

## 5 Upload a the csv file supplied in this repo

And it will be automatically converted to json and saved to the DynamoDB Table 
