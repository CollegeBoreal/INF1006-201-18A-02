.Créer la base de données word
$ docker exec --interactive --tty some-mysql mysql --user root --password --execute "create database word;"

.Créer un utilisateur
$ docker exec --interactive some-mysql  mysql --user root -ppassword \
    --execute "CREATE USER 'voyager'@'%' IDENTIFIED BY 'voyager_1';"
    
. Accorder tous les drois a l'utilisateur d'utiliser la base word
$ docker exec --interactive some-mysql  mysql --user root -password \
   --execute "GRANT ALL ON word.* TO 'voyager'@'%';"

.Charger la base
$ docker exec  --interactive some-mysql  mysql --user root -ppassword word < ~/word-sql/word-schema.sql

. Charger les données
$ docker exec  --interactive some-mysql  mysql --user root -ppassword word < ~/word-sql/word-data.sql
