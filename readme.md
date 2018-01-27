# Hello Acorns

To start the server for the first time, make sure to have Docker installed and then run
```bash
./docker/setup-development.sh
```
This creates the necessary docker volumes and networks.

From then on out, you can start the server with:
```bash
docker-compose up -d
```

To access a running container type:
```bash
docker-compose exec acorn bash
```

To access a stopped container type:
```bash
docker-compose run acorn bash
```

To see what containers are running:
```bash
docker ps
```

To see the logs for a given container:
```bash
docker-compose logs --tail 100 acorn
```

To stop a container:
```bash
docker-compose stop <container-name-optional>
```

