#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Configuration
IMAGE_NAME="alikaan-me"
IMAGE_TAG="latest"

echo -e "${YELLOW}Building Docker image...${NC}"

# Build the Docker image
if docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .; then
    echo -e "${GREEN}✓ Docker image built successfully${NC}"
else
    echo -e "${RED}✗ Failed to build Docker image${NC}"
    exit 1
fi

echo -e "${GREEN}✓ Build completed successfully!${NC}"
