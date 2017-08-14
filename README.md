# Dockerized MySQL Environment

## Run Environment

To start the mysql container run the following command.

```bash
docker-compose up -d
```

## Connect to MySQL

To connect to the mysql container run the following command.

```bash
docker container exec -it mysqlsandbox_mysql_sandbox_1 "bash"
```

Once connected to the container you can connect to mysql using:

```bash
mysql -u root -p
```

## Tear down Environment

To tear down the mysql sandbox environment run the following command.

```bash
docker-compose down
```

To remove all data persisted in mysql specify the `-v` option for the `down` command, which will tell docker to remove the volume used by MySQL as well.