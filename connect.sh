#!/bin/bash
docker-compose up -d && mysql -u root -p -h ${DOCKER_IP}