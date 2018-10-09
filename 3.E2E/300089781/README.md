
1.
$ docker exec --interactive --tty some-mysql mysql --user root -ppassword --execute "create database world;"

2.
$ docker exec --interactive some-mysql  mysql --user root -ppassword \
     --execute "CREATE USER 'voyager'@'%' IDENTIFIED BY 'voyagers_1';"
     
3.
$ docker exec  --interactive some-mysql  mysql --user root -ppassword world < ~/world.sql

4.
$ docker exec  --interactive some-mysql  mysql --user root -ppassword world < ~/world.sql

5.
$ docker exec --interactive --tty some-mysql bash
```
root@2d0704b493d4:/# mysql -u root -p
Enter password: 
```
6.
mysql> use world;
