
1.
```
$ docker exec --interactive --tty some-mysql mysql --user root -ppassword --execute "create database world;"
```
2.
```
$ docker exec --interactive some-mysql  mysql --user root -ppassword \
     --execute "CREATE USER 'voyager'@'%' IDENTIFIED BY 'voyagers_1';"
 ```
3.
```
$ docker exec  --interactive some-mysql  mysql --user root -ppassword world < ~/world.sql
```
4.
```
$ docker exec  --interactive some-mysql  mysql --user root -ppassword world < ~/world.sql
```

5.
```
$ docker exec --interactive --tty some-mysql bash
```

6.
```
mysql> use world;
```

1-Quel est la langue et capital du japon?
```
select Language, Capital
 from 
countrylanguage 
inner join capital,language = Country
where country like japon;
```
2-Combien il y a d habitant en italie?
```
select country sum (population) as population
 from 
country 
inner join country = Country
where country like italia;
```

3-Ou est parler l espagnol?
```
```






![alt tag](Captureworld.PNG)
