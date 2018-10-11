
1. creation de la base de donnee
```
$ docker exec --interactive --tty some-mysql mysql --user root -ppassword --execute "create database world;"
```
2. creation de la root 
```
$ docker exec --interactive some-mysql  mysql --user root -ppassword \
     --execute "CREATE USER 'voyager'@'%' IDENTIFIED BY 'voyagers_1';"
```     
3. charger la base de donnee
```
$ docker exec  --interactive some-mysql  mysql --user root -ppassword world < ~/world.sql
```
4. "" 3
```
$ docker exec  --interactive some-mysql  mysql --user root -ppassword world < ~/world.sql
```
5. entrer dans le container
```
$ docker exec --interactive --tty some-mysql bash
```
6. utiliser la base de donnee dans mysql
```
mysql> use world;
```
![alt tag](screenshot.png)

Savoir quel continent parle anglais
```
mysql> SELECT country.Continent, countrylanguage.Language
from country
inner join countrylanguage on country.Code=countrylanguage.CountryCode
where countrylanguage.Language like 'English%';
```
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
