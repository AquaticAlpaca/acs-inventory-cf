#!/bin/sh

cd ~/Development/acs/inventory
zip one-read.zip one-read.py
~/Development/aws-cli/aws s3 mb s3://acs-parts-inventory
aws s3 cp one-read.zip s3://acs-parts-inventory/
aws cloudformation create-stack --stack-name acs-inventory-lambda --template-body file://one-read-lambda.yaml --capabilities CAPABILITY_IAM
aws cloudformation describe-stacks --stack-name acs-inventory-lambda
# aws lambda update-function-code --function-name acs-inventory-lambda-FetchItemsFunction-BtoWGPFu08M4 --s3-bucket 'acs-parts-inventory' --s3-key 'one-read.zip'
# aws lambda invoke --function-name acs-inventory-lambda-FetchItemsFunction-BtoWGPFu08M4 output.txt
# aws cloudformation update-stack --stack-name acs-inventory-lambda --template-body file://one-read-lambda.yaml --capabilities CAPABILITY_IAM
# aws cloudformation delete-stack --stack-name acs-inventory-lambda

# aws apigateway test-invoke-method --rest-api-id 0pse9hakge --resource-id zjqcvf --http-method GET --path-with-query-string "/Prod/items"


# aws lambda update-function-code --function-name YOUR_FUNCTION_NAME --s3-bucket acs-parts-inventory --s3-key one-read.zip