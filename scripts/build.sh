#!/bin/bash

set -e

IMAGE_NAME="assignment-3-diagnostic"

echo "Building Docker image..."

docker build -t "$IMAGE_NAME" .

echo "Docker image built successfully."

echo
echo "Running Docker smoke test..."

docker run --rm "$IMAGE_NAME" help

echo
echo "Docker smoke test passed."

