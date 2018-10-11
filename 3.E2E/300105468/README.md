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
SELECT  country.Capital AS capital, country.Name AS Pays
FROM
country
WHERE country.Name LIKE 'France';

2.requette
SELECT  countrylanguage.Language AS Langue , SUM(country.Population) AS NombreHabitants
FROM
country
INNER JOIN countrylanguage ON (countrylanguage.CountryCode = country.code) 
WHERE countrylanguage.Language LIKE 'Japon' and country.Name LIKE 'Algeria'
GROUP BY countrylanguage.Language;


3. requette 
select country (population) as population
 from 
country 
inner join countrylanguage = countrylanguage
where language like Ghana;
