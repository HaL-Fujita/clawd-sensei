FROM node:22-slim

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*
RUN npm install -g clawdbot

WORKDIR /app

# Create config on startup if not exists
COPY start.sh /start.sh
RUN chmod +x /start.sh

ENV CLAWDBOT_STATE_DIR=/data

CMD ["/start.sh"]
