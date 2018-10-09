DDL


http://www.mysqltutorial.org/import-csv-file-mysql-table/

Creer la table

```
$ docker exec -i some-mysql mysql -u etudiants -p etudiants \
         < ~/Developer/INF1006-202-18A-02/3.IMPORT/price_table.sql
```

Charger la table

```
$ docker exec -i some-mysql mysql -u etudiants -p --local-infile etudiants \
         < ~/Developer/INF1006-202-18A-02/3.IMPORT/price_table.ctl
```

http://www.xarg.org/2012/08/running-standard-deviation-in-mysql/

changer la table 
```
$ docker exec -i some-mysql mysql -u etudiants -p etudiants < ~/Developer/INF1006-202-18A-02/3.IMPORT/AlterTable_Currency.sql

```

