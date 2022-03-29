curl https://raw.githubusercontent.com/aissa-laribi/awsops/main/ec2/Stop-EC2-Instances-Nightly/lambda_function.py > lambda_function.py
#Replace 'Enter_Region_Name' with your region
zip -9 lambda_function.zip lambda_function.py

aws lambda create-function --function-name ec2-stop  --role <lambda-arn> \
--handler lambda_function.lambda_handler --runtime python3.7 --timeout 120 --zip-file fileb://lambda_function.zip
