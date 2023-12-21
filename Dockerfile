FROM python:3.9-slim

ENV PYTHONUNBUFFERED True

WORKDIR /app

COPY requirement.txt ./

RUN pip install --no-cache-dir -r  requirement.txt

COPY . .

CMD gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 main_endpoint:app