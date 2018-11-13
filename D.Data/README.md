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
