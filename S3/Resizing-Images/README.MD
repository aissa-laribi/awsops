# Lambda Function to Resize Images Automatically


## Purpose

Resizing Automatically any image uploaded to an existing S3 Bucket 
through the Wand Library and AWS Lambda

## Prerequisites 

Two S3 Buckets: A Source Bucket and  Destination Bucket

## Usage

## 1) Create a role and attach the policy for the Lambda function 
if help needed check the commands on how to create a role quickly 
check Resizing-Images/helpers/create-role.sh.
### The Role needs the permissions described in the policy Resizing-Images/iam.json
### And Replace SOURCE-BUCKET AND DESTINATION-BUCKET with the names of your respective
### buckets
## 2) Write the Lambda function
by using the Resizing-Images/lambda-function.py 
### And replace 'DESTINATION-BUCKET' with the name of your Destination bucket
### And replace image.resize(128,128) if needed. For instance, you want 128 x 72
### thumbnails in that case it will be image.resize(128,72)

## 3 Create the Lambda function alongside the Wand library
Download the Wand-0.6.7-py2.py3-none-any.whl ( package from https://pypi.org/project/Wand/. Direct download here.

Download using wget:
```
wget https://files.pythonhosted.org/packages/25/1c/55c69811efdfc7623b70168f25f9d22b593047ba0bd4b99c066a2a5a2c12/Wand-0.6.7-py2.py3-none-any.whl
```
Extract the wheel file in the same folder as lambda_handler.py:
```
unzip Wand-0.6.7-py2.py3-none-any.whl
```
The Wand-0.6.7.dist-info isn't needed:
```
rm -rf Wand-0.6.7.dist-info Wand-0.6.7-py2.py3-none-any.whl
```
Zip the Wand directory along with lambda_handler.py:
```
zip -r9 lambda.zip wand lambda_handler.py
```
Find the Role of the Lamda Function and get its ARN
```
aws iam list-roles | grep Generate-Thumbnails
```
Upload lambda.zip to AWS Lambda.
```
aws lambda create-function --function-name Generate-Thumbnails  --role arn:aws:iam::<NUMBER>:role/Generate-Thumbnails \
--handler lambda_function.lambda_handler --runtime python3.7 --timeout 300 --zip-file fileb://lambda_function.zip
```
## 4 Add the S3 Source Bucket as Triggers in Lambda
Go to the Console, and add the S3 Source Bucket and a trigger for the Lambda function.
### In the Suffix Section add .jpg, And Create Another Trigger with the same Bucket 
### Add in The Suffix Section add .png . You can create as many triggers you want.
### For Instance, another trigger for .bmp, another for .svg
Unfortunately, it's the only task I haven't managed to do from the AWS CLI
If ever, you have a solution, feel free to pull a request :)

## 5 Upload a picture to your source bucket

It will automatically resize the image and dump it to your Destination Bucket