# Lambda Function to Convert Images to the WebP Format Automatically
======

## Purpose

Converting to the WebP format any image uploaded to an existing S3 Bucket 
Automatically through the Wand Library and AWS Lambda

## Prerequisites 

Two S3 Buckets: A Source Bucket and  Destination Bucket
AWS CLI installed and configured
Docker installed

## Usage


## 1) Create a role and attach the policy for the Lambda function 
if help needed check the commands on how to create a role quickly 
check Converting-Images/helpers/create-role.sh.
### The Role needs the permissions described in the policy Converting-Images/iam.json
### And Replace SOURCE-BUCKET AND DESTINATION-BUCKET with the names of your respective
### buckets

## 2) Write the Lambda function
Use the Converting-Images/lambda-function.py 
### And replace 'DESTINATION-BUCKET' with the name of your Destination bucket

### 3)Build the Lambda Container image
Get Converting-Images/Dockerfile Converting-Images/lambda_function.py and 
Converting-Images/requirements.txt into the same directory. Or clone the 
repository

Build the container with all dependencies needed:
```
cd Converting-Images
sudo docker build -t convert-to-webp .
```
Run the container to test the Lambda function 
```
sudo docker run -p 9000:8080 convert-to-webp
```
Open a new terminal and test the Lambda function 
```
curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{}'
```
And in the terminal where the container runs it should return something similar to the following:
```
START RequestId: 9c9a3e36-e7eb-4dc6-9de3-de51ef19da98 Version: $LATEST
06 Apr 2022 23:06:41,456 [INFO] (rapid) extensionsDisabledByLayer(/opt/disable-extensions-jwigqn8j) -> stat /opt/disable-extensions-jwigqn8j: no such file or directory
06 Apr 2022 23:06:41,457 [WARNING] (rapid) Cannot list external agents error=open /opt/extensions: no such file or directory
    for record in event['Records']:y", line 12, in lambda_handler
END RequestId: 9c9a3e36-e7eb-4dc6-9de3-de51ef19da98
REPORT RequestId: 9c9a3e36-e7eb-4dc6-9de3-de51ef19da98  Init Duration: 0.48 ms     Duration: 5528.22 ms    Billed Duration: 5529 ms        Memory Size: 3008 MB       Max Memory Used: 3008 MB
```
Enter CTRL+C  to stop the container running

## 4) Authenticate the Docker CLI to your Amazon ECR registry.
```
aws ecr get-login-password --region us-east-1 | sudo docker login --username AWS --password-stdin <ACCOUNT-NUMBER>.dkr.ecr.us-east-1.amazonaws.com    
```
## 5) Create a repository in Amazon ECR 
```
aws ecr create-repository --repository-name convert-to-webp --image-scanning-configuration scanOnPush=true --image-tag-mutability MUTABLE
```
## 6) Tag your image to match your repository name
```
docker tag  convert-to-webp:latest <ACCOUNT-NUMBER>.dkr.ecr.us-east-1.amazonaws.com/convert-to-webp:latest
```
## 7) Deploy the Container image to ECR repository
```
sudo docker push <ACCOUNT-NUMBER>.dkr.ecr.us-east-1.amazonaws.com/convert-to-webp:latest
```
## 8) Create the Lambda Function
Go to The Console and create a lambda function
### Select Container Image
### Enter a function name for instance "Convert-To-Webp
### Click on Browse images, and select the convert-to-webp repository
### In Images, select the latest image
### Change default execution role, Use an existing role
### Select ConvertToWebp and Create the fucntion
## 9) Add 3 minutes Timeout
Go to Configuration and select General Configuration 
and change timeout to 3 minutes  
## 10) Add the S3 triggers
Add the S3 Source Bucket as Triggers in Lambda
Go to the Console, and add the S3 Source Bucket and a trigger for the Lambda function.
### In the Suffix Section add .jpg
### Create Another Trigger with the same Bucket 
### And add .png in the Suffix Section
### 11) Upload a picture to your source bucket
Any jpg or png image uploaded to your S3 bucket will be converted to the Webp format,
and uploaded to your destination bucket