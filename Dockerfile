FROM python:3.9-slim
# If you need to install Pandas or Numpy then use the following base image
# FROM 593291632749.dkr.ecr.eu-west-1.amazonaws.com/python:3.7-slim

# Create a working directory to do stuff from

# RUN useradd -ms /bin/bash airflow.user -u 1337

# RUN mkdir etl
WORKDIR /etl

# RUN echo $(ls -l /etl)

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY scripts/ scripts/

# # Change ownership of workdir so user can write to root
RUN chmod -R 777 .

RUN echo $(ls -l /etl)
# USER airflow.user
# RUN echo $UID

ENTRYPOINT python -u scripts/run2.py
