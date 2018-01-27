# Hello Acorns

To start the server for the first time, make sure to have Docker installed and then run
```bash
./setup-development.sh
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

