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
 mysql> mysql -u root -p ;
 password: password
 mysql> use world;
```

#Les requetes:
affichage les noms du pays qui ont la langue English comme langue principale
```
mysql>select c.Language, d.name
 from 
countrylanguage c
join country d on d.code = c.CountryCode
where Language = 'English' ;
```
affichage de population par le nom de villes qui ont plus de 273000:
```
msql>Select city.Name , sum(country.Population) as population

from city 

join country  using(Population) 
group by city.Name
having sum(country.Population) > 273000;
```
affichage les langues principaux de la ville Kabul
```
mysql>select city.Name, countrylanguage.Language
from city

join countrylanguage using(CountryCode) 
where city.Name = 'Kabul';
```

![alt tag](pict.png)
