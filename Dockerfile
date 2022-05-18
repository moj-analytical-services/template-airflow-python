
ARG DE_ECR 
FROM {DE_ECR}/python:3.9-slim
# There are a number of other source images available:
# FROM {DE_ECR}/python:3.9-bullseye
# FROM {DE_ECR}/python:3.8-bullseye
# FROM {DE_ECR}/python3.7-slim
# FROM {DE_ECR}/python3.7
# FROM {DE_ECR}/rstudio:4.0.5-5
# FROM {DE_ECR}/datascience-notebook:3.1.13

# Create a working directory to do stuff from
WORKDIR /etl

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY scripts/ scripts/

ENTRYPOINT python -u scripts/copy_data.py
