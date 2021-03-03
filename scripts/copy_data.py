import os
from dataengineeringutils3.s3 import copy_s3_folder_contents_to_new_folder

if __name__ == "__main__":
    from_bucket = "bucket-name-to-copy-from"
    from_path = "path/in/from/bucket/"
    to_bucket = "bucket-name-to-copy-to"
    to_path = "path/to/copy/to"

    s3_from = os.path.join(
        f"s3://{from_bucket}",
        from_path
    )
    s3_to = os.path.join(
        f"s3://{to_bucket}",
        to_path
    )
    copy_s3_folder_contents_to_new_folder(s3_from, s3_to)
