import json

def lambda_handler(event, context):
    print("🔹 Transforming raw to processed...")

    # Simulate receiving raw data
    raw_data = event.get("data", "sample raw data")

    # Placeholder transformation
    processed_data = {
        "cleaned": raw_data.upper(),
        "metadata": {"source": "raw", "stage": "processed"}
    }

    print("✅ Processed data:", json.dumps(processed_data))

    return {
        "statusCode": 200,
        "body": json.dumps({"message": "Data processed", "data": processed_data})
    }
