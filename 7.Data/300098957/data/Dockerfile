FROM sequenceiq/spark:1.6.0

RUN curl -s http://central.maven.org/maven2/mysql/mysql-connector-java/8.0.13/mysql-connector-java-8.0.13.jar -o /usr/local/spark/lib/mysql-connector-java-8.0.13.jar

COPY scripts /data/scripts
