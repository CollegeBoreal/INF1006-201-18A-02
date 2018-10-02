
1ere requete:

```
mysql> select customer.last_name as 'Nom', sum(amount) as 'Montant Total de la Facture' FROM customer,payment,address,city WHERE payment.customer_id = customer.customer_id and  city LIKE 'Lubumbashi' group by customer.last_name ;
```

2eme requete:

mysql> select customer.last_name AS 'Nom', payment.amount AS 'Montant de la Facture', country.country AS 'Pays' FROM customer,payment,country WHERE payment.customer_id = customer.customer_id and country LIKE 'Congo%' OR country LIKE 'Algeria' group by customer.last_name ;

3eme requete :

mysql> select customer.last_name AS 'Nom', SUM(payment.amount) AS 'Montant Total de la Facture', country.country AS 'Pays' FROM customer,payment,country WHERE payment.customer_id = customer.customer_id and country LIKE 'Congo%' OR country LIKE 'Algeria' group by customer.last_name ;
