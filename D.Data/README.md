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

