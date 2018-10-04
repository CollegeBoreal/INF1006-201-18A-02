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
SELECT category.name, avg(film.length) 
FROM film
JOIN film_category USING (film_id) 
JOIN category USING (category_id) 
GROUP BY category.name
ORDER BY avg(film.length) DESC;
```
