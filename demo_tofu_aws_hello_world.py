# AWS lambda hander that returns "hello world".help
# 
# Thanks to the AWS developer guide pages:
#
# https://docs.aws.amazon.com/apigateway/latest/developerguide/getting-started.html
#
# https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-create-api-as-simple-proxy-for-lambda.html

import json

def lambda_handler(event, context):
    print(event)
    return {
        "statusCode": 200,
        "headers": {
            "Content-Type": "*/*"
        },
        "body": "hello world"
    }
