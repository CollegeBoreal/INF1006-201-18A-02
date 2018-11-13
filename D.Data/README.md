# Data



## [Docker](https://docker.io)

### Créer le fichier de configuration Docker (Dockerfile: encore appellé le Docker makefile )

```
$ cat <<EOF > Dockerfile
FROM sequenceiq/spark:1.6.0

RUN curl -s http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.38/mysql-connector-java-5.1.38.jar -o /usr/local/spark/lib/mysql-connector-java-5.1.38.jar

COPY scripts /data/scripts
EOF
```

### Créer l'image Docker du projet

```
$ docker image build .
```

### Récupérer l'ID de l'image

```
$ docker images
```

### Donner un nom et version à l'image (Tagger)

```
$ docker image tag <image ID> myapp:latest
```

## Éxécuter le conteneur en utilisant le `tag`


### Créer le fichier de configuration Docker (Dockerfile: encore appellé le Docker makefile )

```
$ cat <<EOF > docker-compose.yml
version: '3'

services:
   spark:
     build: ./data
     ports:
       - "8088:8088"
       - "8042:8042"
       - "4040:4040"
     entrypoint:
       - "/etc/bootstrap.sh"
       - -d
     depends_on:
       - any-mysql
#       - db

   any-msql:
     image: mysql
     environment:
      - MYSQL_ROOT_PASSWORD=password

networks:
  default:
    external:
      name: bridge
EOF
```
