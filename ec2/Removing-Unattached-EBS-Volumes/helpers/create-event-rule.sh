aws events put-rule --name "EC2-Remove-EBS-Schedule" --schedule-expression "cron(30 18 ? * MON-FRI *)"
#Check the arn of your lambda function by entering the following command
aws lambda list-functions
aws events put-targets --rule EC2-Remove-EBS-Schedule --targets "Id"="1","Arn"="<arn of your lambda function>"