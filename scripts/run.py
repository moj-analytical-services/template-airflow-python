import os
import tempfile
import boto3
from dataengineeringutils3.s3 import (
    copy_s3_object,
    write_local_file_to_s3,
)

run = os.getenv("RUN")
#from_path = os.getenv("FROM")
to_path = os.getenv("TO")
#text = os.getenv("TEXT")
#write_outpath = os.getenv("OUTPATH")
db_name = os.getenv("DATABASE")
tb_name = os.getenv("TABLENAME")
query_path = os.getenv("QUERYPATH")

if run == "copy":
    if not query_path or not to_path:
        raise ValueError(f"Missing FROM and/or TO env vars. Got FROM => {query_path}. TO => {to_path}.")
    copy_s3_object(query_path, to_path)

elif run == "query":
    client = boto3.client("athena")
    client.start_query_execution(
        QueryString = 'SELECT count(*) FROM db_name.tb_name;',
    QueryExecutionContext = {'Database' : db_name},
    ResultConfiguration={'OutputLocation': query_path,})

else:
    raise ValueError(f"Bad RUN env var. Got {run}. Expected 'copy' or 'write'.")

