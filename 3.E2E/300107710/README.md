  
World
1.Création la base de données world
````
docker exec --interactive --tty some-mysql mysql --user root --password --execute "create database world;"
````

2.Création de l'utilisateur voyager avec comme mot de passe voyager_1
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
  5.1 1ère requette. En quelle année l'Algérie a eu son indépendance ?
````
SELECT  c.IndepYear AS AnnéeIndépendance, c.Name AS Pays
FROM
country c
WHERE c.Name ='algeria';
````
  5.2 2ème requette. Quel est le nombre des habitants qui parle la langue Arabe au Maroc ?
````
SELECT  countrylanguage.Language AS Langue , SUM(country.Population) AS NombreHabitants
FROM
country
INNER JOIN countrylanguage ON (countrylanguage.CountryCode = country.code) 
WHERE countrylanguage.Language = 'Arabic' and country.Name = 'Morocco'
GROUP BY countrylanguage.Language;
````
5.3 3ème requette. Quel est le nombre des habitants qui parle la langue Arabe dans la ville de Casablanca?
````
SELECT  countrylanguage.Language AS Langue , SUM(city.Population) AS NombreHabitants
FROM
city
INNER JOIN country ON (country.Code = city.CountryCode)
INNER JOIN countrylanguage ON (countrylanguage.CountryCode = country.code) 
WHERE countrylanguage.Language = 'Arabic' and city.Name = 'Casablanca'
GROUP BY countrylanguage.Language;
````
6.Afficher le schéma 


![Alt tag](world.png)

