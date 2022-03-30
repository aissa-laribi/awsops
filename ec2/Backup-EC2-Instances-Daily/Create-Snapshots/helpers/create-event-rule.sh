aws events put-rule --name "EC2-Backup-Schedule" --schedule-expression "cron(5 17 ? * MON-FRI *)"
#Check the arn of your lambda function by entering the following command
aws lambda list-functions
aws events put-targets --rule EC2-Backup-Schedule --targets "Id"="1","Arn"="<arn of your lambda function>"
