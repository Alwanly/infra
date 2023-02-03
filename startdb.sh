#!/bin/bash

docker-compose up -d mongodb mongodb2 redis

sleep 5

docker exec mongodb /scripts/rs-init.sh