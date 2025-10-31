#!/bin/bash

set -e  # Exit on any error

STRAPI_VERSION="v5.30.0"
RELEASE_URL="https://github.com/strapi/strapi/archive/refs/tags/${STRAPI_VERSION}.tar.gz"
SRC_DIR="src"

# Create src directory if it doesn't exist
mkdir -p "${SRC_DIR}"

echo "Downloading Strapi ${STRAPI_VERSION} from GitHub..."
curl -L -o "${SRC_DIR}/strapi-${STRAPI_VERSION}.tar.gz" "${RELEASE_URL}"

echo "Extracting archive..."
tar -xzf "${SRC_DIR}/strapi-${STRAPI_VERSION}.tar.gz" -C "${SRC_DIR}" --strip-components=1

echo "Download and extraction complete. Strapi source is in ${SRC_DIR}/"

# Set the STRAPI_RELEASE environment variable
export STRAPI_RELEASE="${STRAPI_VERSION}"

echo "Building Docker images with STRAPI_RELEASE=${STRAPI_RELEASE}..."
docker compose build

echo "Pushing Docker images..."
docker compose push

echo "Build and push complete!"

