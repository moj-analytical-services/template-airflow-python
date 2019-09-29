import os

import boto3


s3 = boto3.client('s3')


def copy_directory(from_bucket, from_path, to_bucket, to_path):
    """
    This function copies contents from one bucket (or path in bucket) to a
    new bucket (or path in bucket
    :param from_bucket:
    :param from_path:
    :param to_bucket:
    :param to_path:
    :return:
    """
    file_list = s3.list_objects_v2(
        Bucket=from_bucket,
        Prefix=from_path
    ).get("Contents", [])
    for file_object in file_list:
        key = file_object.get("Key")
        copy_source = {
            "Bucket": from_bucket,
            "Key": key
        }
        to_key = os.path.join(to_path, key.replace(from_path, "", 1))
        s3.copy(CopySource=copy_source, Bucket=to_bucket, Key=to_key)
