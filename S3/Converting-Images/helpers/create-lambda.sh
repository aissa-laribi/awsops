curl https://raw.githubusercontent.com/aissa-laribi/awsops/main/S3/Converting-Images/lambda_function.py > lambda_function.py
#Replace 'Enter_Region_Name' with your region
zip -r9 lambda_function.zip wand lambda_function.py
aws iam list-roles | grep ConvertToWebp
aws lambda create-function --function-name ConvertToWebp  --role arn:aws:iam::133631580572:role/ConvertToWebp \
--handler lambda_function.lambda_handler --runtime python3.8 --timeout 300 --memory 512 --zip-file fileb://lambda_function.zip