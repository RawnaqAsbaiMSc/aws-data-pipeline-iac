import json

def lambda_handler(event, context):
    print("✅ Lambda triggered by S3 event")
    print("Event payload:")
    print(event)
    return {
        "statusCode": 200,
        "body": "Trigger received and logged"
    }
