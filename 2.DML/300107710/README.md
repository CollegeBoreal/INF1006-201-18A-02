
1ere requete:

````
SELECT 
    m.last_name AS 'Nom',
    SUM(p.amount) AS 'Montant Total de la Facture'
FROM
    customer m,
    payment p,
    address a,
    city c
WHERE
    a.address_id = m.address_id AND    
    p.customer_id = m.customer_id AND
    c.city_id = a.city_id
        AND c.city LIKE 'Lubumbashi'
GROUP BY m.last_name;
````

2eme requete:

````
Select o.country AS Pays, m.last_name as Nom, p.amount as Facture from 
customer m
inner join address a on m.address_id = a.address_id
inner join city c on a.city_id = c.city_id 
inner join country o on o.country_id = c.country_id 
inner join payment p on p.customer_id = m.customer_id 
where country like 'Congo%' OR country like 'Algeria';
````

3eme requete :

````
SELECT 
    IFNULL(o.country, 'TOUS LES PAYS') AS Pays,
    IFNULL(m.last_name, 'Total') AS Nom,
    SUM(p.amount) AS Facture
FROM
    customer m
INNER JOIN address a ON m.address_id = a.address_id
INNER JOIN city c ON a.city_id = c.city_id
INNER JOIN country o ON o.country_id = c.country_id
INNER JOIN payment p ON p.customer_id = m.customer_id
WHERE
    country LIKE 'Congo%'
    OR country LIKE 'Algeria'
GROUP BY o.country , m.last_name
having SUM(p.amount)>100 ;
````

4eme Requete

````
SELECT actor.last_name, COUNT(actor_id) 
FROM actor
JOIN film_actor USING (actor_id) 
GROUP BY actor.last_name 
ORDER BY COUNT(actor.actor_id) desc 
LIMIT 1  ;

````

5eme Requete

````
SELECT c.name, avg(f.length) AS DURATION
FROM film f
JOIN film_category USING(film_id) 
JOIN category c USING(category_id)
GROUP BY c.name
ORDER BY avg(f.length) DESC;
````

6eme REquete

````
SELECT c.name, avg(f.length) AS DURATION
FROM film f
JOIN film_category USING(film_id) 
JOIN category c USING(category_id)
GROUP BY c.name 
HAVING avg(f.length) > (SELECT avg(film.length) FROM film)
ORDER BY avg(f.length) DESC;
````
