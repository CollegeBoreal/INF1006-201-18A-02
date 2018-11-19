# Data

## Creer votre propre repertoire :id:

```
$ mkdir <id> && cd $_
```

## Creer le repertoire `Scripts`

```
$ mkdir -p data/scripts
```

### Creer le Script `Spark`

```Scala
$ cat <<EOF > data/scripts/initial_data_dump.scala

import org.apache.spark.sql.SQLContext

val sqlContext = new SQLContext(sc)
val driver = "com.mysql.jdbc.Driver"

// ANY MYSQL DB
val userSrcDB = "root"
val passSrcDB = "password"

val urlSource = "jdbc:mysql://src-mysql:3306/sakila?useSSL=false"

// Prepare destination parameters
val prop = new java.util.Properties
prop.setProperty("user", "root")
prop.setProperty("password", "password")

val urlDest = s"jdbc:mysql://dst-mysql:3306/myDB?useSSL=false"

// Importing countries
val country = sqlContext.read.
              format("jdbc").
              option("url", urlSource).
              option("driver", driver).
              option("user", userSrcDB).
              option("password", passSrcDB).
              option("dbtable", "country").
              load()

country.select($"country_id", $"country").write.mode("append").jdbc(urlDest,"COUNTRIES",prop)

System.exit(0)
EOF
```

## [Docker](https://docker.io)

### Créer le fichier de configuration Docker (Dockerfile: encore appellé le Docker makefile )

```
$ cat <<EOF > data/Dockerfile
FROM sequenceiq/spark:1.6.0

RUN curl -s http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.38/mysql-connector-java-5.1.38.jar -o /usr/local/spark/lib/mysql-connector-java-5.1.38.jar

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
       - "8088:8088"
       - "8042:8042"
       - "4040:4040"
     entrypoint:
       - "/etc/bootstrap.sh"
       - -d
     container_name: some-spark
     depends_on:
       - src-mysql
       - dst-mysql

   src-mysql:
     image: mysql:5.7
     container_name: src-mysql
     environment:
      - MYSQL_ROOT_PASSWORD=password

   dst-mysql:
     image: mysql:5.7
     container_name: dst-mysql
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

## lancer le Spark (Shell/CLI)

```bash
$ spark-shell \
     --driver-memory 4g --executor-memory 4g \
     --jars /usr/local/spark/lib/mysql-connector-java-5.1.38.jar \
     -i data/scripts/initial_data_dump.scala
```

## Tester

### Spark (Shell/CLI) UI

```
http://<IP>:4040 
```

### Hadoop 

* Node Manager

```
http://<IP>:8042
```

* Cluster Manager

```
http://<IP>:8088
```

# ETL (Extract Transform Load)

## To export to file (data only)
```
$ docker exec --interactive dst-mysql mysqldump -u root -ppassword --no-create-info myDB > mydb-data.sql
```

## To export to file (schema only)
```
$ docker exec --interactive dst-mysql mysqldump -u root -ppassword --no-data mydb > mydb-schema.sql
```
