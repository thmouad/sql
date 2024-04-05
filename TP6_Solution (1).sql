use ecole


--1.	Créer une connexion ‘log1’ avec le mot de passe ‘DBgroup@’
create login log1 with password='DBgroup@'

--2.	Ajouter dans cette base de données un utilisateur «user1» pour la connexion ‘log1’.

create user user1 for login log1
--3.	Ouvrir une nouvelle instance de SQL Server Management Studio, et se connecter avec le compte log1 :

--4. Exécuter la requête suivante : select * from eleve, Que remarquez-vous
/*L'autorisation SELECT a été refusée sur l'objet 'eleve', base de données 'ecole', schéma 'dbo'.
l'utilisateur user1 n'a aucune persmission sur aucune base de donnée */

--5.	Accorder à l’utilisateur ‘user1’ uniquement la permission d’accéder aux données de la table eleve.
grant  select on classe to user1

--6.	Vérifier si l’utilisateur ‘user1’ peut accéder aux données de la table classe.

--7.	Exécuter la requête suivante insert into classe values ('P107'), Que remarquez-vous ?
--L'autorisation INSERT a été refusée sur l'objet 'classe', base de données 'ecole', schéma 'dbo'

--8.	Accorder à l’utilisateur ‘user1’ la permission d’insérer des données dans la table classe.
grant  insert on classe to user1

--10.	Exécuter la requête suivante : select * from eleve, Que remarquez-vous ?
--L'autorisation SELECT a été refusée sur l'objet 'eleve', base de données 'ecole', schéma 'dbo'.

--11.	Retirer le droit d’insérer des données dans la table classe pour l’utilisateur ‘user1’
revoke insert on classe from user1

--12.	Créer une connexion ‘log2’ avec le mot de passe ‘DBgroup2@’
create login log2 with password='DBgroup2@'

--13.	Ajouter dans la base de données ‘ecole’ un utilisateur ‘user2’ pour la connexion ‘log2’.
create user user2 for login log2

--14.	Accorder à l’utilisateur ‘user1’ la permission d’accéder aux données de la table classe avec 
--l’option de passer ce droit à d’autre utilisateurs
grant  select on classe to user1 WITH GRANT OPTION;

--16.	Vérifier si l’utilisateur ‘user2’ peut accéder aux données de la table classe. Que remarquez-vous ?
-- Oui l’utilisateur ‘user2’ peut accéder aux données de la table classe

--17.	Retirer le droit de SELECT à l’utilisateur ‘user1’ avec : Revoke select on classe to user1; 
--Que remarquez-vous ?  Il faut spécifier l'option CASCADE.
Revoke  select on classe to user1 ;
Revoke  select on classe to user1 cascade;

--19.	Créer une connexion ‘log3’ avec le mot de passe ‘DBgroup3@’ et ajouter dans la base de données ‘TP5’ 
--un utilisateur ‘user3’ pour la connexion ‘log3’.
use tp5ex1
create login log3 with password='DBgroup3@'
create user user3 for login log3

--20.	Accorder à l’utilisateur ‘user3’ la permission de modifier la colonne salary de la table employee.
grant update(salary) on employee to user3

--23. Effectuer une sauvegarde de la base de données ecole, puis supprimer cette dernière avec drop et 
--essayer de faire d’une restauration.

backup database ecole to disk= 'ecolebackup.bak';
drop database ecole;
RESTORE database ecole from disk = 'ecolebackup.bak';