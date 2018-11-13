1. creation de la base de donnee RestAfrique
```
$ docker exec --interactive --tty some-mysql mysql --user root -ppassword --execute "create database RestAfrique;"
```
2. creation l'utilisateur delice avec comme mot de passe delice_1
```
$ docker exec --interactive some-mysql  mysql --user root -ppassword \
     --execute "CREATE USER 'delice'@'%' IDENTIFIED BY 'delice_1';"
```     
3. charger la base de donnee RestAfrique
```
$ docker exec  --interactive some-mysql  mysql --user root -ppassword RestAfrique < ~/RestAfrique.sql
```
4. "" 3
```
$ docker exec  --interactive some-mysql  mysql --user root -ppassword RestAfrique < ~/RestAfrique.sql
```
5. entrer dans le container
```
$ docker exec --interactive --tty some-mysql bash
```
6. utiliser la base de donnee dans mysql
```
mysql> use RestAfrique;
```
