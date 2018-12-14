# :x:

```
$ docker exec  --interactive some-mysql  mysql --user root -ppassword RestAfrique < ~/Restafrique.sql 
mysql: [Warning] Using a password on the command line interface can be insecure.
ERROR 1064 (42000) at line 44: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'VISIBLE,
  CONSTRAINT `fk_tarrifs`
    FOREIGN KEY (`prix`)
    REFERENCES `rest' at line 9
```
