# Lambda Function to Delete Files Over A Defined Size Automatically

## Purpose

Deleting Automatically any file uploaded to an existing S3 Bucket 
exceeding a defined size limit through AWS Lambda

### In this example, any file exceeding 2MB will be instantly deleted 

![](https://github.com/aissa-laribi/awsops/blob/main/S3/Setting-Size-Limitations/diagram.png)


## Usage

## 1) Create a role and attach the policy for the Lambda function 
if help needed check the commands on how to create a role quickly 
check Setting-Size-Limitations/helpers/create-role.sh.
### The Role needs the permissions described in the policy Setting-Size-Limitations/iam.json
### And Replace SOURCE-BUCKET AND DESTINATION-BUCKET with the names of your respective
### buckets
## 2) Write the Lambda function
by using the Setting-Size-Limitations/lambda-function.py 
### Replace in line 10 the number 2000 if you want to define a different limit. For instance,
### if you want to set a limit of 10MB enter "if size >= 10000:"

## 3 Upload the Lambda function 
Use the Setting-Size-Limitations/helpers/create-function.sh file to upload the function
alongside the S3LimiterRole 

## 4 Add the S3 Source Bucket as Triggers in Lambda
Go to the Console, and add the S3 Source Bucket and a trigger for the Lambda function.
Unfortunately, it's the only task I haven't managed to do from the AWS CLI
If ever, you have a solution, feel free to pull a request :)

## 5 Upload a file over you size limit to your source bucket

It will automatically delete the file
