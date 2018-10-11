1.Créer la base de données word:


$ docker exec --interactive --tty some-mysql mysql --user root --password --execute "create database word;"

2.Créer un utilisateur:

$ docker exec --interactive some-mysql  mysql --user root -ppassword \
    --execute "CREATE USER 'voyager'@'%' IDENTIFIED BY 'voyager_1';"
    
3. Accorder tous les drois a l'utilisateur d'utiliser la base word:

$ docker exec --interactive some-mysql  mysql --user root -password \
   --execute "GRANT ALL ON word.* TO 'voyager'@'%';"

4.Charger la base:

$ docker exec  --interactive some-mysql  mysql --user root -ppassword word < ~/word-sql/word-schema.sql

5. Charger les données:

$ docker exec  --interactive some-mysql  mysql --user root -ppassword word < ~/word-sql/word-data.sql



---------------------Devoir-----------------------------------------
1.Requette

Quel est le nom de la capital de la Guinée?

SELECT  country.Name AS Pays, city.Name As capitale 
FROM
country
inner join city on country.Capital = city.ID
WHERE country.Name Like 'Guinea%';



2.requette

Quelles sont les langues parlées au Sénégal?


SELECT  countrylanguage.Language AS Langue , SUM(country.Population) AS Population
FROM
country
INNER JOIN countrylanguage ON (countrylanguage.CountryCode = country.code) 
WHERE country.Name = 'Senegal'
GROUP BY countrylanguage.Language; 


3. requette 

Quelle est la langue la plus parlée à Ghana?

select country (population) as population
 from 
country  
inner join countrylanguage = countrylanguage
where language like Ghana;
