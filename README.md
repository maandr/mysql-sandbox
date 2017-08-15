# Dockerized MySQL Environment

## Run Environment

To start the mysql container run the following command.

```bash
docker-compose up -d
```

## Connect to MySQL

To connect to the mysql server running in the docker container.

```bash
mysql -u root -p -h ${DOCKER_IP}
```

## Run and connect

To start the mysql container and connect to the mysql server right away run the following command.

```bash
./connect.sh
```

## Tear down Environment

To tear down the mysql sandbox environment run the following command.

```bash
docker-compose down
```

To remove all data persisted in mysql specify the `-v` option for the `down` command, which will tell docker to remove the volume used by MySQL as well.