aws events put-rule --name "EC2-Prune-Schedule" --schedule-expression "cron(50 17 ? * MON-FRI *)"
#Check the arn of your lambda function by entering the following command
aws lambda list-functions
aws events put-targets --rule EC2-Prune-Schedule --targets "Id"="1","Arn"="<arn of your lambda function>"
