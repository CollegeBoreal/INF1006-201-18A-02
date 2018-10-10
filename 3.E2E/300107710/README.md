  
World
1.Créer la base de données world
````
docker exec --interactive --tty some-mysql mysql --user root --password --execute "create database world;"
````

2.Créer l'utilisateur voyager avec comme mot de passe voyager_1
````
docker exec --interactive some-mysql  mysql --user root -ppassword --execute "CREATE USER 'voyager'@'%' IDENTIFIED BY 'voyager_1';"
````

3.Donner les droits à l'utilisateur d'utiliser la base de données world
````
$ docker exec --interactive some-mysql  mysql --user root -ppassword --execute "GRANT ALL ON world.* TO 'voyager'@'%';"
````

4.Charger la base de données world
````
$docker exec  --interactive some-mysql  mysql --user root -ppassword world < ~/world.sql
````
5.Les requettes
  5.1 1ère requette
````

````
  5.2 2ème requette
````

````
5.3 3ème requette
````

````
7.Afficher le schéma 

![Alt tag](world.png)

