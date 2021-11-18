FROM python:3.9-alpine

RUN apk update
RUN apk add git

WORKDIR /app
ENV PYTHONPATH /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY ./site_root /app/site_root
COPY ./publish.sh /app/publish.sh

ENTRYPOINT ["./publish.sh"]
