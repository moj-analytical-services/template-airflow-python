FROM 189157455002.dkr.ecr.eu-west-1.amazonaws.com/python:3.9-slim
# If you need to install Pandas or Numpy then use the following base image
# FROM 593291632749.dkr.ecr.eu-west-1.amazonaws.com/python:3.7-slim

# Create a working directory to do stuff from
WORKDIR /etl

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY scripts/ scripts/

# Ensures necessary permissions available to user in docker image
RUN chmod -R 777 .

ENTRYPOINT python -u scripts/run.py
