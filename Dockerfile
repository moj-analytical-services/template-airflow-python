FROM python:alpine3.10
# If you need to install Pandas or Numpy then use the following base image
# FROM python:slim

WORKDIR /home/app

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

RUN addgroup -g 1000 -S app && \
    adduser -u 1000 -S app -G app
USER app

COPY . /home/app

ENTRYPOINT python -u /home/app/run.py
