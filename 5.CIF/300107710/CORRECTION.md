# :x:

## :one: Erreur fichier

```
$ docker exec  --interactive some-mysql  mysql --user root -ppassword MyResto < ~/Developer/INF1006-202-18A-02/5.CIF/300107710/MyResto.sql 
-bash: /Users/valiha/Developer/CollegeBoreal/INF1006-202-18A-02/5.CIF/300107710/MyResto.sql: No such file or directory
```

```
$ $ docker exec  --interactive some-mysql  mysql --user root -ppassword MyResto < ~/Developer/INF1006-202-18A-02/5.CIF/300107710/mostafa.sql 
mysql: [Warning] Using a password on the command line interface can be insecure.
ERROR 1826 (HY000) at line 117: Duplicate foreign key constraint name 'Plat_id'
```

## :two: Erreur BD 

la BD `mostafa` au lieu de `MyResto` est a prendre en compte

## :three: Modele mismatch

Le modele sauvegarde dans github n'est pas le meme presente sans le .png

:warning: Le modele sur github .mwb a ete note a la place 
