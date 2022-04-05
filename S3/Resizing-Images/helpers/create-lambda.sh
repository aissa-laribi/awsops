curl https://raw.githubusercontent.com/aissa-laribi/awsops/main/S3/Resizing-Images/lambda_function.py > lambda_function.py
#Replace 'Enter_Region_Name' with your region
zip -r9 lambda_function.zip wand lambda_function.py
aws iam list-roles | grep Generate-Thumbnails
aws lambda create-function --function-name Generate-Thumbnails  --role arn:aws:iam::<NUMBER>:role/Generate-Thumbnails \
--handler lambda_function.lambda_handler --runtime python3.7 --timeout 300 --zip-file fileb://lambda_function.zip

aws lambda add-permission --function-name Resize-Images \
--action lambda:InvokeFunction --principal s3.amazonaws.com \
--source-arn arn:aws:s3:::source-lslslsls --statement-id 1