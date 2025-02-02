import json
import boto3

def handler(event, context):
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('acs-parts-inventory')
    response = table.scan()
    return {
        'statusCode': 200,
        'headers': {
          'Access-Control-Allow-Origin': 'http://acs-inventory-websitestack-gg1reqef04t0-s3bucket-ggixjqhqzkyt.s3-website.us-east-2.amazonaws.com', # Required for CORS support to work
          'Access-Control-Allow-Headers': '*',
          'Access-Control-Allow-Methods': 'GET, OPTIONS'
        },
        'body': json.dumps(response['Items'])
    }
