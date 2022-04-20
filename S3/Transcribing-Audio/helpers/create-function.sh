curl https://raw.githubusercontent.com/aissa-laribi/awsops/main/S3/Transcribing-Audio/lambda_function.py > lambda_function.py
#Replace 'Enter_Region_Name' with your region
zip -r9 lambda_function.zip lambda_function.py
aws iam list-roles | grep S3Transcribe
aws lambda create-function --function-name S3Transcribe  --role arn:aws:iam::<ACCOUNT-NUMBER>:role/S3Transcribe \
--handler lambda_function.lambda_handler --runtime python3.9 --zip-file fileb://lambda_function.zip --timeout 400