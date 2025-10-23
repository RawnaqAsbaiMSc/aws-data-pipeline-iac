import urllib.request
import json
import boto3

def lambda_handler(event, context):
    url = "https://api.open-meteo.com/v1/forecast?latitude=33.59&longitude=-7.61&hourly=temperature_2m"
    try:
        with urllib.request.urlopen(url) as response:
            data = json.loads(response.read().decode())
            temperature = data["hourly"]["temperature_2m"][0]
            message = f"Current temperature in Casablanca: {temperature}°C"

            # Log to S3
            s3 = boto3.client("s3")
            bucket_name = "<your-bucket-name>"  # e.g., rawnaq-demo-weather-logs
            key = f"weather-log-{context.aws_request_id}.txt"
            s3.put_object(Bucket=bucket_name, Key=key, Body=message)

            return {
                "statusCode": 200,
                "body": message
            }
    except Exception as e:
        return {
            "statusCode": 500,
            "body": f"Error fetching weather data: {str(e)}"
        }
