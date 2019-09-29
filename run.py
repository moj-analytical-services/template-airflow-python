from etl.copy_data import copy_directory


if __name__ == "__main__":
    from_bucket = "bucket-name-to-copy-from"
    from_path = "path/in/from/bucket/"
    to_bucket = "bucket-name-to-copy-to"
    to_path = "path/to/copy/to"
    copy_directory(from_bucket, from_path, to_bucket, to_path)
