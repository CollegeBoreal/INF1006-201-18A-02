# :x:

## :one: erreur dans la commande de chargement schema `password` DB n'existe pas 

```
$ docker exec  --interactive some-mysql  mysql --user root -ppassword password < ~/madewithlove.sql
mysql: [Warning] Using a password on the command line interface can be insecure.
ERROR 1049 (42000): Unknown database 'password'
```

changement de nom de DB a `mwl_schema`

```
$ docker exec  --interactive some-mysql  mysql --user root -ppassword mwl_schema < ~/madewithlove.sql
mysql: [Warning] Using a password on the command line interface can be insecure.
```
