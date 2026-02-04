#!/bin/bash

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Check if 'down' parameter is passed
if [ "$1" == "down" ]; then
    echo -e "${YELLOW}Stopping containers...${NC}"
    docker compose -f docker-compose.prod.yml down
    echo -e "${GREEN}✓ Containers stopped${NC}"
    exit 0
fi

echo -e "${YELLOW}Pulling latest code...${NC}"
git pull origin master

echo -e "${YELLOW}Building Docker image...${NC}"
./build.sh

echo -e "${YELLOW}Stopping containers...${NC}"
docker compose -f docker-compose.prod.yml down

echo -e "${YELLOW}Starting containers...${NC}"
docker compose -f docker-compose.prod.yml up -d

echo -e "${GREEN}✓ Deployment completed!${NC}"
echo -e "${YELLOW}SSL certificate will be generated automatically${NC}"