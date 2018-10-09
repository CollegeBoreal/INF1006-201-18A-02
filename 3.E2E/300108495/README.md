
```
$ docker exec --interactive --tty some-mysql mysql --user root --password --execute "create database world;"

$ docker exec --interactive some-mysql  mysql --user root -ppassword \
    --execute "CREATE USER 'voyager'@'%' IDENTIFIED BY 'voyager_1';"
  
 $ docker exec --interactive some-mysql  mysql --user root -ppassword \
   --execute "GRANT ALL ON world.* TO 'voyager'@'%';" 
 $docker exec  --interactive some-mysql  mysql --user root -ppassword world < ~/world.sql  
 
 $ docker exec  --interactive some-mysql  mysql --user root -ppassword world < ~/world.sql
 
 $ docker exec --interactive --tty some-mysql bash
 mysql> use world;
```
