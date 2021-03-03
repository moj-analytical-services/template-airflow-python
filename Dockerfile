FROM 593291632749.dkr.ecr.eu-west-1.amazonaws.com/python:alpine3.10
# If you need to install Pandas or Numpy then use the following base image
# FROM 593291632749.dkr.ecr.eu-west-1.amazonaws.com/python:3.7-slim

# Create a working directory to do stuff from
WORKDIR /etl

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY scripts/ scripts/

ENTRYPOINT python -u scripts/copy_data.py
