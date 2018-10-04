1er requete

```
SELECT actor.last_name, COUNT(actor_id)
FROM actor
JOIN film_actor USING (actor_id) 
GROUP BY actor.last_name
ORDER BY COUNT(actor.actor_id) desc 
LIMIT 1
```

2eme requete
```
SELECT c.name, avg(f.length) AS duration 
FROM film f
JOIN film_category USING (film_id) 
JOIN category c USING (category_id) 
GROUP BY c.name
ORDER BY avg(f.length) DESC;
```
