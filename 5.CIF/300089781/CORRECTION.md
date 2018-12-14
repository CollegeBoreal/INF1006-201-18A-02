# :x:

```
$ docker exec  --interactive some-mysql  mysql --user root -ppassword password < ~/madewithlove.sql
mysql: [Warning] Using a password on the command line interface can be insecure.
ERROR 1049 (42000): Unknown database 'password'
```

```
$ docker exec  --interactive some-mysql  mysql --user root -ppassword mwl_schema < ~/madewithlove.sql
mysql: [Warning] Using a password on the command line interface can be insecure.
ERROR 1273 (HY000) at line 14: Unknown collation: 'utf8mb4_0900_ai_ci'
```

# Model

Model non identique avec celui sauvegarde
