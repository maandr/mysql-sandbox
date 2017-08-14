#!/bin/bash

docker-compose up -d && /
docker container exec -it mysqlsandbox_mysql_sandbox_1 "bash"