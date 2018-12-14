# :x:

## :one: erreur dans la commande passwd

```
$ docker exec --interactive some-mysql  mysql --user root -ppassword \ --execute "CREATE USER 'paul'@'%' IDENTIFIED BY 'paul1';"
mysql: [Warning] Using a password on the command line interface can be insecure.
mysql  Ver 8.0.11 for Linux on x86_64 (MySQL Community Server - GPL)
Copyright (c) 2000, 2018, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Usage: mysql [OPTIONS] [database]

```

## :two: le fichier SQL charge dans la BD myDB pas dans la BD service

```
$ docker exec  --interactive some-mysql  mysql --user root -ppassword service < ~/service.sql
```
