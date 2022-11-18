FROM python:3.10

# Allow statements and log messages to immediately appear in the Cloud Run logs
ENV PYTHONUNBUFFERED True

WORKDIR /app

COPY requirements.txt ./

RUN pip install -r requirements.txt

COPY . ./

# Use gunicorn webserver with one worker process and 8 threads
# For environments with multiple CPU cores, increase the number of workers to be equal to the cores available
# Timeout is set to 0 to disable the timeouts of the workers to allow Cloud Run to handle instance scaling
CMD exec gunicorn --bind :8080 --workers 1 --threads 8 --timeout 0 app:app
