# :x:

## :one: Erreur de Contrainte dans le chargement

```
$ $ docker exec  --interactive some-mysql  mysql --user root -ppassword RestAfrique < ~/Restafrique.sql 
mysql: [Warning] Using a password on the command line interface can be insecure.
ERROR 1826 (HY000) at line 131: Duplicate foreign key constraint name 'fk_clients'
```
