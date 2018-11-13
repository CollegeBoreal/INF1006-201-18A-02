# Data

## Scripts

```
$ mkdir -p data/scripts
```

### Creer le Script Spark

```Scala
$ cat <<EOF > data/scripts/initial_data_dump.scala

import org.apache.spark.sql.SQLContext

val sqlContext = new SQLContext(sc)
val driver = "com.mysql.jdbc.Driver"

// ANY MYSQL DB
val userSrcDB = "root"
val passSrcDB = "password"
val urlSource = "jdbc:mysql://any-mysql:3306/sakila?useSSL=false"

// Prepare destination parameters
val userDestDB = "root"
val passDestDB = "password"
val nameDestDB = "myDB"
val prop = new java.util.Properties
prop.setProperty("user", userDestDB)
prop.setProperty("password", passDestDB)
val urlDest = s"jdbc:mysql://some-mysql:3306/$nameDestDB?useSSL=false"

// Importing countries
val df_iso_countries_oldDB = sqlContext.read.format("jdbc").option("url", urlSource).option("driver", driver).option("dbtable", "iso_countries").option("user", userSrcDB).option("password", passSrcDB).option("verifyServerCertificate", "false").load()
val df_countries_oldDB = sqlContext.read.format("jdbc").option("url", urlSource).option("driver", driver).option("dbtable", "countries").option("user", userSrcDB).option("password", passSrcDB).option("verifyServerCertificate", "false").load()
val df_countries_join_iso_oldDB = df_countries_oldDB.as("countries").join(df_iso_countries_oldDB.as("iso"),$"countries.country_name"===$"iso.printable_name")
df_countries_oldDB.write.mode("overwrite").parquet("data/temp/COUNTRIES")
val df_countries_newDB = df_iso_countries_oldDB.select($"id", $"printable_name" as "name",$"iso3" as "code")
//val df_countries_newDB = df_countries_join_iso_oldDB.select($"countries.id", $"iso.printable_name" as "name",$"iso.iso3" as "code")
df_countries_newDB.write.mode("append").jdbc(urlDest,"COUNTRIES",prop) // Overwrite existing countries

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
     depends_on:
       - any-mysql
#       - db

   any-mysql:
     image: mysql
     environment:
      - MYSQL_ROOT_PASSWORD=password

networks:
  default:
    external:
      name: bridge
EOF
```
