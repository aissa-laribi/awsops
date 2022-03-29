Lambda Function to Stop All EC2 Instances in a Region Nightly    
========

## Purpose

Stopping all iddle instances out of the business hours

## Usage

Alongside the Lambda function, and the role permissions supplied in this repository,
create a CloudWatch Event Rule with a Cron expression 

Cron expression: 0 18 ? * MON-FRI *

Monday to Friday, everyday at 6pm Local Time
 
