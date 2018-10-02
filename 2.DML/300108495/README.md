# 1er requete:
```
mysql> select customer.last_name AS nom, sum(payment.amount) AS facture 
from customer,address,city,payment 
where city.city_id like 'Lubumbashi%' group by customer.last_name;
```
 
 # 2eme requete:
 ```
 mysql> select customer.last_name AS nom, payment.amount AS facture 
 from customer,address,country,payment
 where customer.customer_id and  country.country_id = 'Congo The Democratic Republic of the' and customer.customer_id and     country.country_id = 'Algeria' group by customer.last_name;
 ```
 
 
 # 3eme requete :
 ```
msql> select customer.last_name AS nom, sum(payment.amount) AS facture 
from customer,address,country,payment
where customer.customer_id and  country.country_id = 'Congo The Democratic Republic of the' and customer.customer_id and country.country_id = 'Algeria' group by customer.last_name;
 ```
