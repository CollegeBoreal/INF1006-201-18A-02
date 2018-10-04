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
