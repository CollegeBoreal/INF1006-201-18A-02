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
