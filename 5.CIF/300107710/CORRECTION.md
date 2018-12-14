# :x:

```
$ docker exec  --interactive some-mysql  mysql --user root -ppassword MyResto < ~/Developer/INF1006-202-18A-02/5.CIF/300107710/MyResto.sql 
-bash: /Users/valiha/Developer/CollegeBoreal/INF1006-202-18A-02/5.CIF/300107710/MyResto.sql: No such file or directory
```

```
$ docker exec  --interactive some-mysql  mysql --user root -ppassword MyResto < ~/Developer/INF1006-202-18A-02/5.CIF/300107710/mostafa.sql 
mysql: [Warning] Using a password on the command line interface can be insecure.
ERROR 1022 (23000) at line 117: Can't write; duplicate key in table 'Tarif'
```
