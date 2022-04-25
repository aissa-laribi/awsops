# Lambda Function to Automatically Transcribe any Audio uploaded to S3

## Purpose

Automatically transcribe audio uploaded to S3

## Usage

## 1) Create a role and attach the policy for the Lambda function 
if help needed check the commands on how to create a role quickly 
check Transcribing-Audio/helpers/create-role.sh.
### The Role needs the permissions described in the policy S3Transcribe/iam.json
### And Replace <YOUR-BUCKET> with the name of your respective bucket
## 2) Write the 2 Lambda functions
by using the S3Transcribe/lambda-function.py and Parsing/lambda-function.py
## 3) Upload the Lambda functions 
Use the Transcribing-Audio/helpers/create-function.sh file to upload the function
alongside the S3Transcribe Role 
## 4) Add the S3 Source Bucket as Trigger in the Lambda Function S3Transcribe  
Go to the Console, add the S3 Source Bucket and a trigger for the S3Transcribe Lambda function.
### And add the suffix .mp3, for other audio formats repeat the process and add other suffixes such as .wav or .mp4
## 5) Add the S3 Source Bucket as Trigger in the Lambda Function ParseTanscription   
Go to the Console, and add the S3 Source Bucket and a trigger for the S3Transcribe Lambda function.
### And add the suffix .mp3.json
## 6) Upload a the audio file supplied in this repo
And it will be automatically transcribed and uploaded to your S3 bucket
