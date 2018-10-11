```
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

6.
mysql> use world;
```
![alt tag](screenshot.png)

mysql> SELECT count(*) FROM country WHERE population like '%'; 

Savoir quel pays parle anglais
```
mysql> SELECT country.code,countrylanguage.language 
FROM countrylanguage 
inner join country on country.code=countrylanguage.CountryCode
WHERE language like 'English%' ;
```
Savoir le nom de villes avec leurs population
```
mysql> SELECT city.name, country.Population
FROM city
inner JOIN country on country.Population=city.Population
```
