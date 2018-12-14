# :x:

```
$ docker exec  --interactive some-mysql  mysql --user root -ppassword fashion < ~/fashion.sql 
mysql: [Warning] Using a password on the command line interface can be insecure.
ERROR 1215 (HY000) at line 221: Cannot add foreign key constraint
```
