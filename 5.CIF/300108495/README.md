# Creation de la base de données fashion
```
$ docker exec --interactive --tty some-mysql mysql --user root --password --execute "create database fashion;"
```
## Creation de l'utilisateur fash avec comme mot de passe fash_1
```
$ docker exec --interactive some-mysql  mysql --user root -ppassword \
    --execute "CREATE USER 'fash'@'%' IDENTIFIED BY 'fash_1';"
```    
 ## Donner les droits à l'utilisateur d'utiliser la base de données fashion
 ```
 $ docker exec --interactive some-mysql  mysql --user root -ppassword \
   --execute "GRANT ALL ON fashion.* TO 'fash'@'%';" 
 ```
 ### Charger la base de données fashion
 ```
 $docker exec  --interactive some-mysql  mysql --user root -ppassword fashion < ~/fashion.sql  
 ```
 ### choisir la base de donnee dans mysql
 ```
 $ docker exec --interactive --tty some-mysql bash
 mysql> mysql -u root -p ;
 password: password
 mysql> use fashion;
```


![Alt tag](fashion1.png)
