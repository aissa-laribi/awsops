aws events put-rule --name "Stop-EC2-Nightly-Schedule" --schedule-expression "cron(0 18 * * MON-FRI *)"
#Check the arn of your lambda function by entering the following command
aws lambda list-functions
aws events put-targets --rule Stop-EC2-Nightly-Schedule --targets "Id"="1","Arn"="<arn of your lambda function>"

