#!/bin/bash

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Determine which docker-compose file to use
if [ "$1" == "prod" ]; then
    COMPOSE_FILE="docker-compose.prod.yml"
    echo -e "${YELLOW}Using production configuration${NC}"
else
    COMPOSE_FILE="docker-compose.yml"
    echo -e "${YELLOW}Using development configuration${NC}"
fi

# Check if 'down' parameter is passed
if [ "$1" == "down" ] || [ "$2" == "down" ]; then
    echo -e "${YELLOW}Stopping containers...${NC}"
    docker compose -f $COMPOSE_FILE down
    echo -e "${GREEN}✓ Containers stopped${NC}"
    exit 0
fi

echo -e "${YELLOW}Pulling latest code...${NC}"
git pull origin main

echo -e "${YELLOW}Building Docker image...${NC}"
./build.sh

echo -e "${YELLOW}Stopping containers...${NC}"
docker compose -f $COMPOSE_FILE down

echo -e "${YELLOW}Starting containers...${NC}"
docker compose -f $COMPOSE_FILE up -d

echo -e "${GREEN}✓ Deployment completed!${NC}"
if [ "$1" == "prod" ]; then
    echo -e "${YELLOW}SSL certificate will be generated automatically${NC}"
fi