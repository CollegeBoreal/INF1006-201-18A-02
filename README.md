# INF1006-202-18A-02
Système de gestion de bases de données

## Devoirs:

| Date   |                                                     |     Commentaires                                                      |
|:------:|:----------------------------------------------------|:----------------------------------------------------------------------|
|20-09-18| [3NF](./0.3NF)                                      | * Domaine, * 1NF, * 2NF, * 3NF                                        |
|20-09-18| [Modele](./1.Modele)                                | Presenter l'ebauche du model sous MySQL Workbench, fichier _*.mwb_    |
|02-10-18| [DML](./2.DML#exercices)                            | Exercices de requetes sur Sakila                                      |



## Resultats d'Apprentissage du Cours

|No|L'etudiant(e) aura demontre, de facon fiable, sa capacite a:      |          Elements de performance                               | 
|--|------------------------------------------------------------------|:---------------------------------------------------------------| 
| 1| Créer et gérer, à l’aide d’un logiciel basé sur du texte, une base de données relationnelle en fonction des besoins particuliers d’une situation donnée                                                | * Créer une base de données en fonction de la commande reçue
|  |                                                                  | * Créer des tables dans une base de données existante
|  |                                                                  | * Maintenir des données (p. ex., ajouter, supprimer et modifier des records dans une table) |
|  |                                                                  | * Créer une copie de sauvegarde (backup) d’une base de données |
|  |                                                                  | * Créer une requête appropriée en fonction du contexte donné   |
|  |                                                                  | * Créer une sous-requête en fonction du contexte donné         | 
|  |                                                                  | * Créer une vue appropriée en fonction du contexte donné       |
|  |                                                                  | * Définir les relations entre des tables                       |

## Elements de Performance

|No| Date   | Cours                       | Intitulé                                |  Pratique .                            |
|--|--------|:----------------------------|:----------------------------------------|:---------------------------------------|
| 1|05-09-17|                             | Rentree des classes                     |                                        |


## References

https://books.goalkicker.com/MySQLBook/ (free books)

http://sql.sh/ressources/cours-sql-sh-.pdf (En francais)

### Docker

https://hub.docker.com/_/mysql/

```
$ docker run --name some-mysql --env MYSQL_ROOT_PASSWORD=password --detach mysql:latest
```


### SGBD:

. lancer le CLI (Command Level Interface) de MySQL

```
# mysql -u root -p 
```


. Dans le CLI 

.. créer une base de données

```
mysql> CREATE DATABASE etudiants;
```

.. créer les utilisateurs

- Version Longue

```
mysql> CREATE USER 'etudiants'@'localhost' IDENTIFIED BY 'etudiants_1';
mysql> GRANT ALL ON etudiants.* TO 'etudiants'@'localhost';
```

- Version Simplifiee incluant tous les hotes
```
mysql> GRANT ALL ON etudiants.* TO 'etudiants'@'%' IDENTIFIED BY 'etudiants_1';
```
