
Création de la base de données MyResto
````
$docker exec --interactive --tty some-mysql mysql --user root --password --execute "create database MyResto;"
````
Création l'utilisateur most avec mot de passe most_1
````
$docker exec --interactive some-mysql  mysql --user root -ppassword \
    --execute "CREATE USER 'most'@'%' IDENTIFIED BY 'most_1';"
````
Donner les droits à l'utilisateur most d'utiliser la base de données MyResto
````
$docker exec --interactive some-mysql  mysql --user root -ppassword \
  --execute "GRANT ALL ON MyResto.* TO 'most'@'%';" 
````

Charger la base de données MyResto
````
$ docker exec  --interactive some-mysql  mysql --user root -ppassword MyResto < ~/Developer/INF1006-202-18A-02/5.CIF/300107710/MyResto.sql 
````

charger la database MyResto dans mysql

````
$docker exec --interactive --tty some-mysql bash
mysql> mysql -u root -p ;
password: password
mysql> use MyResto;
````

Schema

![Alt tag](MyResto.png)












