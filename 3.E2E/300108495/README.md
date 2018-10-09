#1:
creation de la base de données world
```
$ docker exec --interactive --tty some-mysql mysql --user root --password --execute "create database world;"
```
#2:
creation l'utilisateur voyager avec comme mot de passe voyager_1
```
$ docker exec --interactive some-mysql  mysql --user root -ppassword \
    --execute "CREATE USER 'voyager'@'%' IDENTIFIED BY 'voyager_1';"
```    
 #3
 Donner les droits à l'utilisateur d'utiliser la base de données world
 ```
 $ docker exec --interactive some-mysql  mysql --user root -ppassword \
   --execute "GRANT ALL ON world.* TO 'voyager'@'%';" 
 ```
 #4
 charger la base de données world
 ```
 $docker exec  --interactive some-mysql  mysql --user root -ppassword world < ~/world.sql  
 ```
 changer the database dans mysql
 ```
 
 $ docker exec --interactive --tty some-mysql bash
 mysql> use world;
```

