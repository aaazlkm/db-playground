# db-playground

db 起動方法

```
docker build -t db -f DockerFile.db .
docker run -dp -p 3306:3306 db
docker exec -it 2d4bdcb61c85 bash
```
