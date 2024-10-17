#!/bin/sh

# Deploy the root stack
aws cloudformation create-stack --stack-name acs-inventory --template-body file://stacks/stacks.yaml --capabilities CAPABILITY_IAM
aws cloudformation describe-stacks --stack-name acs-inventory
aws cloudformation delete-stack --stack-name acs-inventory

# aws cloudformation create-stack --stack-name acs-inventory-table --template-body file://stacks/database.yaml --capabilities CAPABILITY_IAM
# aws cloudformation describe-stacks --stack-name acs-inventory-table
# aws cloudformation update-stack --stack-name acs-inventory-table --template-body file://create-inventory-table.yaml --capabilities CAPABILITY_IAM
# aws cloudformation delete-stack --stack-name acs-inventory-table

# Create a test item
# aws dynamodb put-item --table acs-parts-inventory --item '{"id": {"S": "Test20241017_070920"}}'