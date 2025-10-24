import boto3

def lambda_handler(event, context):
    s3 = boto3.client('s3')

    source_bucket = event['Records'][0]['s3']['bucket']['name']
    source_key = event['Records'][0]['s3']['object']['key']

    final_data = s3.get_object(Bucket=source_bucket, Key=source_key)['Body'].read()
    print(f"Final analytics data for {source_key}:")
    print(final_data.decode('utf-8'))
