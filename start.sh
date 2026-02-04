#!/bin/sh

mkdir -p /data

# Generate gateway token if not set
if [ -z "$CLAWDBOT_GATEWAY_TOKEN" ]; then
  export CLAWDBOT_GATEWAY_TOKEN=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
  echo "Generated CLAWDBOT_GATEWAY_TOKEN"
fi

# Create config if it doesn't exist
if [ ! -f /data/clawdbot.json ]; then
  cat > /data/clawdbot.json << EOF
{
  "channels": {
    "telegram": {
      "enabled": true
    }
  },
  "gateway": {
    "mode": "local",
    "bind": "lan",
    "auth": {
      "token": "$CLAWDBOT_GATEWAY_TOKEN"
    }
  }
}
EOF
  echo "Created /data/clawdbot.json"
fi

exec clawdbot gateway run --port ${PORT:-10000} --bind lan
