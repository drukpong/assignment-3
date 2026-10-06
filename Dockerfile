FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y bash iputils-ping netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY app/app.sh /app/app.sh

RUN chmod +x /app/app.sh

ENTRYPOINT ["/app/app.sh"]
