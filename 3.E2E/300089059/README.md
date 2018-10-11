
1.Creation de base de données(DB) World
```
$ docker exec --interactive --tty some-mysql mysql --user root -ppassword --execute "create database world;"
```
2.Creation de l'utilisateur voyager avec le mot de passe voyager_1
```
$ docker exec --interactive some-mysql  mysql --user root -ppassword \
     --execute "CREATE USER 'voyager'@'%' IDENTIFIED BY 'voyagers_1';"
 ```
3.Donner les droits à l'utilisateur d'utiliser la DB world
```
$  docker exec --interactive some-mysql  mysql --user root -ppassword \
  --execute "GRANT ALL ON world.* TO 'voyager'@'%';" 
```

4.Charger la base de données World
```
$ docker exec  --interactive some-mysql  mysql --user root -ppassword world < ~/world.sql
```

5.Charger World dans mysql
```
$ docker exec --interactive --tty some-mysql bash
```

6.Utiliser 
```
mysql> use world;
```

1-Quel est la langue et capital du japon?
```
select Language, Capital
 from 
countrylanguage 
inner join capital,language = Country
where country like japon;
```
2-Combien il y a d habitant en italie?
```
select country sum (population) as population
 from 
country 
inner join country = Country
where country like italia;
```

3-Ou est parler l espagnol?
```
select country (population) as population
 from 
country 
inner join countrylanguage = countrylanguage
where language like spanish;
```






![alt tag](Captureworld.PNG)
