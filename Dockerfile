FROM python:3.8-slim-buster

# Install python packages
RUN python -m pip install --upgrade pip
RUN pip install mlflow boto3

# Create folders
RUN mkdir /mlflow
RUN mkdir /db
RUN mkdir /secrets

EXPOSE 5000

# Launch mlflow server
CMD mlflow server \
    --host 0.0.0.0 \
    --port 5000 \
    --default-artifact-root s3://dgmd-mlflow-store \
    --backend-store-uri sqlite:////db/mlflowdb.sqlite