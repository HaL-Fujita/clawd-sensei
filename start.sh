#!/bin/sh

mkdir -p /data

# Create config if it doesn't exist
if [ ! -f /data/clawdbot.json ]; then
  cat > /data/clawdbot.json << 'EOF'
{
  "channels": {
    "telegram": {
      "enabled": true
    }
  },
  "gateway": {
    "mode": "local",
    "bind": "lan"
  }
}
EOF
  echo "Created /data/clawdbot.json"
fi

exec clawdbot gateway run --port 10000 --bind lan
