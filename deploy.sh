#!/bin/bash

# Get the target deployment color: blue or green
TARGET=$1

if [ "$TARGET" != "blue" ] && [ "$TARGET" != "green" ]; then
  echo "Usage: ./deploy.sh [blue|green]"
  exit 1
fi

echo "🔄 Switching to $TARGET deployment..."

# Update nginx.conf dynamically using environment variable
export TARGET_APP="${TARGET}_app"

# Use `envsubst` to safely inject the container name into nginx.conf template
envsubst '${TARGET_APP}' < nginx/nginx.template.conf > nginx/nginx.conf

# Rebuild and restart containers with the updated Nginx config
docker compose up --build -d

echo "✅ Deployment switched to $TARGET"
