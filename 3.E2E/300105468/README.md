1.Créer la base de données word:

$ docker exec --interactive --tty some-mysql mysql --user root --password --execute "create database word;"

2.Créer un utilisateur:

$ docker exec --interactive some-mysql  mysql --user root -ppassword \
    --execute "CREATE USER 'voyager'@'%' IDENTIFIED BY 'voyager_1';"
    
3. Accorder tous les drois a l'utilisateur d'utiliser la base word:

$ docker exec --interactive some-mysql  mysql --user root -password \
   --execute "GRANT ALL ON word.* TO 'voyager'@'%';"

4.Charger la base:

$ docker exec  --interactive some-mysql  mysql --user root -ppassword word < ~/word-sql/word-schema.sql

5. Charger les données:

$ docker exec  --interactive some-mysql  mysql --user root -ppassword word < ~/word-sql/word-data.sql

