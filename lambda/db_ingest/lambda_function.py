import os
import boto3 # type: ignore
import json
from sqlalchemy import create_engine # type: ignore
import pandas as pd # type: ignore

def lambda_handler(event, context):
    # Load DB connection details from environment variables
    db_type = os.environ['DB_TYPE']         # e.g., 'postgresql', 'mysql', 'sqlite'
    db_user = os.environ['DB_USER']
    db_pass = os.environ['DB_PASSWORD']
    db_host = os.environ['DB_HOST']
    db_port = os.environ['DB_PORT']
    db_name = os.environ['DB_NAME']
    raw_bucket = os.environ['RAW_BUCKET']
    query = os.environ.get('DB_QUERY', 'SELECT * FROM your_table LIMIT 10')

    # Build SQLAlchemy connection string
    db_url = f"{db_type}://{db_user}:{db_pass}@{db_host}:{db_port}/{db_name}"

    try:
        # Connect and query
        engine = create_engine(db_url)
        df = pd.read_sql(query, engine)

        # Convert to JSON
        json_data = df.to_json(orient='records')

        # Upload to S3
        s3 = boto3.client('s3')
        s3.put_object(
            Bucket=raw_bucket,
            Key='db_ingest/data.json',
            Body=json_data
        )

        return {
            "status": "success",
            "records": len(df),
            "bucket": raw_bucket
        }

    except Exception as e:
        return {
            "status": "error",
            "message": str(e)
        }
