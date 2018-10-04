 Excercice requete mysql
 
 exercice 2 sur les requetes
1ere requetes
SELECT count(film_actor), actor and film, FROM actor ;



CORRECTION:
SELECT actor.last_name,COUNT(actor_id)
FROM actor
JOIN film_actor USING (actor_id)
GROUP BY actor.last_name 
ORDER BY COUNT(actor.actor_id) desc
LIMIT 1 ;







correction 2
SELECT c.name, avg(f.length) AS duration  
FROM film f
 JOIN film_category USING (film_id) 
 JOIN category c USING (category_id)
 GROUP BY c.name
 ORDER BY avg (f.length) DESC;









correction 3
SELECT c.name, avg(f.length) AS duration  
FROM film f
 JOIN film_category USING (film_id) 
 JOIN category c USING (category_id)
 GROUP BY c.name
 HAVING  avg (f.length) > (SELECT avg (film.length) FROM film)
 ORDER BY avg (f.length) DESC;
