#!/bin/sh

cd ~/Development/acs/inventory
cd lambdas; zip one-read.zip one-read.py; cd ..
# ~/Development/aws-cli/aws s3 mb s3://acs-parts-inventory
aws s3 cp lambdas/one-read.zip s3://acs-parts-inventory/
aws cloudformation create-stack --stack-name acs-inventory-lambda --template-body file://one-read-lambda.yaml --capabilities CAPABILITY_IAM
aws cloudformation describe-stacks --stack-name acs-inventory-lambda
# aws lambda invoke --function-name acs-inventory-LambdasStack-1KS4-FetchItemsFunction-vK2JTywwJB4p output.txt
# aws cloudformation update-stack --stack-name acs-inventory-lambda --template-body file://one-read-lambda.yaml --capabilities CAPABILITY_IAM
# aws cloudformation delete-stack --stack-name acs-inventory-lambda

# aws apigateway test-invoke-method --rest-api-id hf8cf320w4 --resource-id u8hi3u --http-method GET --path-with-query-string "/Prod/items"


# aws lambda update-function-code --function-name acs-inventory-LambdasStack-1KS4-FetchItemsFunction-vK2JTywwJB4p --s3-bucket acs-parts-inventory --s3-key one-read.zip
