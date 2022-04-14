curl https://raw.githubusercontent.com/aissa-laribi/awsops/main/S3/Setting-Size-Limitations/lambda_function.py > lambda_function.py
#Replace 'Enter_Region_Name' with your region
zip -r9 lambda_function.zip wand lambda_function.py
aws iam list-roles | grep S3SizeLimiter
aws lambda create-function --function-name S3SizeLimiter  --role arn:aws:iam::<NUMBER>:role/S3SizeLimiter \
--handler lambda_function.lambda_handler --runtime python3.9 --zip-file fileb://lambda_function.zip