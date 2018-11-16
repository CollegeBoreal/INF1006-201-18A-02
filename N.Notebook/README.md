# Spark Notebook

## Creer votre propre repertoire :id:

```
$ mkdir <id> && cd $_
```

## Creer le repertoire `Scripts`

```
$ mkdir -p data/scripts
```

### Creer le Script `Spark` (A revoir) :x:

```Scala
$ cat <<EOF > data/scripts/initial_data_dump.scala

System.exit(0)
EOF
```

## [Docker](https://docker.io)

### Créer le fichier de configuration Docker (Dockerfile: encore appellé le Docker makefile )

```
$ cat <<EOF > data/Dockerfile
FROM andypetrella/spark-notebook:0.8.3-scala-2.11.8-spark-2.2.2-hadoop-2.6.0-with-hive

RUN curl -s http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.38/mysql-connector-java-5.1.38.jar -o /opt/docker/lib/mysql-connector-java-5.1.38.jar

COPY scripts /data/scripts
EOF
```

### Créer le fichier de configuration Docker (Dockerfile: encore appellé le Docker makefile )

```
$ cat <<EOF > docker-compose.yml
version: '3'

services:
   spark:
     build: ./data
     ports:
       - "9000:9000"
       - "4040-4045:4040-4045"
     container_name: note-spark
     depends_on:
       - note-src-mysql
       - note-dst-mysql

   note-src-mysql:
     image: mysql
     container_name: note-src-mysql
     environment:
      - MYSQL_ROOT_PASSWORD=password

   note-dst-mysql:
     image: mysql
     container_name: note-dst-mysql
     environment:
      - MYSQL_ROOT_PASSWORD=password
EOF
```
## Construire

```
$ docker-compose build
```


## Orchestrer

```bash
$ docker-compose up -d
```

# Spark

## Entrer dans le Shell du Container

```bash
$ docker exec --interactive --tty some-spark bash
```

## pas de Spark (Shell/CLI) :x:


## Tester

### Spark Notebook 

```
http://<IP>:9000
```

### Spark (Shell/CLI) UI

```
http://<IP>:4040 a 4044 (Dependant des clusters spark)
```

