curl https://raw.githubusercontent.com/aissa-laribi/awsops/main/S3/Translating-Text-Content/lambda_function.py > lambda_function.py
#Replace 'Enter_Region_Name' with your region
zip -r9 lambda_function.zip lambda_function.py
aws iam list-roles | grep S3Translate
aws kms create-key
aws lambda create-function --function-name S3Translate  --role arn:aws:iam::<account-number>:role/S3Translate \
--handler lambda_function.lambda_handler --runtime python3.9 --zip-file fileb://lambda_function.zip --timeout 400
