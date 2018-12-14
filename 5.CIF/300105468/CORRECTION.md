# :x:

## :one: Erreur de Contrainte dans le chargement

```
$ $ docker exec  --interactive some-mysql  mysql --user root -ppassword RestAfrique < ~/Restafrique.sql 
mysql: [Warning] Using a password on the command line interface can be insecure.
ERROR 1826 (HY000) at line 131: Duplicate foreign key constraint name 'fk_clients'
```

## :two: La base RestAfrique est cree dans le script mais pas utilisee

```
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| RestAfrique        |
| fashion            |
| information_schema |
| mwl_schema         |
| mydb               |
| mysql              |
| performance_schema |
| restafrique        |
| service            |
| sys                |
+--------------------+
10 rows in set (0.00 sec)

mysql> use restafrique;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+-----------------------+
| Tables_in_restafrique |
+-----------------------+
| CLIENTS               |
| COMMANDES             |
| FRUITS                |
| INGREDIENTS           |
| PLATS                 |
| TARRIFS               |
| VENTES                |
+-----------------------+
7 rows in set (0.00 sec)

mysql> use RestAfrique;
Database changed
mysql> show tables;
Empty set (0.00 sec)
```
