import json

def lambda_handler(event, context):
    print("🔹 Ingesting data...")

    # Placeholder: simulate fetching from external API or source
    data = {
        "timestamp": "2025-10-24T07:15:00Z",
        "payload": "sample raw data"
    }

    # Simulate writing to S3 (you'll use boto3 later)
    print("✅ Raw data ready for upload:", json.dumps(data))

    return {
        "statusCode": 200,
        "body": json.dumps({"message": "Data ingested", "data": data})
    }
