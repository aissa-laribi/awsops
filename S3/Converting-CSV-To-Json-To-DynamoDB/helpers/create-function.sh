curl https://raw.githubusercontent.com/aissa-laribi/awsops/main/S3/Converting-CSV-To-Json-To-DynamoDB/lambda_function.py > lambda_function.py
#Replace 'Enter_Region_Name' with your region
zip -r9 lambda_function.zip lambda_function.py
aws iam list-roles | grep CSVTODYNAMODB
aws lambda create-function --function-name CSVTODYNAMODB  --role arn:aws:iam::<ACCOUNT-NUMBER>:role/CSVTODYNAMODB \
--handler lambda_function.lambda_handler --runtime python3.9 --zip-file fileb://lambda_function.zip --timeout 200