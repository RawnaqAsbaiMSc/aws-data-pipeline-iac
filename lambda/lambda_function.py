import urllib.request
import json

def lambda_handler(event, context):
    url = "https://api.open-meteo.com/v1/forecast?latitude=33.59&longitude=-7.61&hourly=temperature_2m"
    try:
        with urllib.request.urlopen(url) as response:
            data = json.loads(response.read().decode())
            temperature = data["hourly"]["temperature_2m"][0]
            return {
                "statusCode": 200,
                "body": f"Current temperature in Casablanca: {temperature}°C"
            }
    except Exception as e:
        return {
            "statusCode": 500,
            "body": f"Error fetching weather data: {str(e)}"
        }
