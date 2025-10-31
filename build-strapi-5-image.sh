#!/bin/bash

set -e  # Exit on any error

# Ask user for Strapi version
read -p "Enter Strapi version (e.g., v5.30.0): " STRAPI_VERSION

# Export the version as environment variable
export STRAPI_RELEASE="${STRAPI_VERSION}"

echo "Building Docker images with STRAPI_RELEASE=${STRAPI_RELEASE}..."
docker compose build

echo "Pushing Docker images..."
docker compose push

echo "Build and push complete!"

