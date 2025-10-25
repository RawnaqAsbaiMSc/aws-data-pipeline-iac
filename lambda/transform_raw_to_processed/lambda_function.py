import boto3, os

def lambda_handler(event, context):
    s3 = boto3.client('s3')
    output_bucket = os.environ['OUTPUT_BUCKET']

    source_bucket = event['Records'][0]['s3']['bucket']['name']
    source_key = event['Records'][0]['s3']['object']['key']

    processed_data = s3.get_object(Bucket=source_bucket, Key=source_key)['Body'].read()
    analytics_data = processed_data[::-1]

    s3.put_object(
        Bucket=output_bucket,
        Key=f'analytics/{source_key}',
        Body=analytics_data
    )
