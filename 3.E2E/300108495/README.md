###creation de la base de données world
```
$ docker exec --interactive --tty some-mysql mysql --user root --password --execute "create database world;"
```
###creation l'utilisateur voyager avec comme mot de passe voyager_1
```
$ docker exec --interactive some-mysql  mysql --user root -ppassword \
    --execute "CREATE USER 'voyager'@'%' IDENTIFIED BY 'voyager_1';"
```    
 #Donner les droits à l'utilisateur d'utiliser la base de données world
 ```
 $ docker exec --interactive some-mysql  mysql --user root -ppassword \
   --execute "GRANT ALL ON world.* TO 'voyager'@'%';" 
 ```
 #charger la base de données world
 ```
 $docker exec  --interactive some-mysql  mysql --user root -ppassword world < ~/world.sql  
 ```
 changer the database dans mysql
 ```
 
 $ docker exec --interactive --tty some-mysql bash
 mysql> use world;
```

![alt tag](https://github.com/CollegeBoreal/INF1006-202-18A-02/blob/master/3.E2E/Screenshot(27).png)
