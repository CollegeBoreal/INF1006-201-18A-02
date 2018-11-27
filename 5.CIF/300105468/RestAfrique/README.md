## 🔎Creation de la base de donnee RestAfrique
```
$ docker exec --interactive --tty some-mysql mysql --user root -ppassword --execute "create database RestAfrique;"
```
## 🔎Creation l'utilisateur delice avec comme mot de passe delice_1
```
$ docker exec --interactive some-mysql  mysql --user root -ppassword \
     --execute "CREATE USER 'delice'@'%' IDENTIFIED BY 'delice_1';"
```     
## 🔎Charger la base de donnee RestAfrique
```
$ docker exec  --interactive some-mysql  mysql --user root -ppassword RestAfrique < ~/RestAfrique.sql
```
## 🔎Execution
```
$ docker exec  --interactive some-mysql  mysql --user root -ppassword RestAfrique < ~/RestAfrique.sql
```
## 🔎Entrer dans le container
```
$ docker exec --interactive --tty some-mysql bash
```
## 🔎Utiliser la base de donnee dans mysql
```
mysql> use RestAfrique;
```
