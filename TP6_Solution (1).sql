use ecole


--1.	Cr�er une connexion �log1� avec le mot de passe �DBgroup@�
create login log1 with password='DBgroup@'

--2.	Ajouter dans cette base de donn�es un utilisateur �user1� pour la connexion �log1�.

create user user1 for login log1
--3.	Ouvrir une nouvelle instance de SQL Server Management Studio, et se connecter avec le compte log1 :

--4. Ex�cuter la requ�te suivante : select * from eleve, Que remarquez-vous
/*L'autorisation SELECT a �t� refus�e sur l'objet 'eleve', base de donn�es 'ecole', sch�ma 'dbo'.
l'utilisateur user1 n'a aucune persmission sur aucune base de donn�e */

--5.	Accorder � l�utilisateur �user1� uniquement la permission d�acc�der aux donn�es de la table eleve.
grant  select on classe to user1

--6.	V�rifier si l�utilisateur �user1� peut acc�der aux donn�es de la table classe.

--7.	Ex�cuter la requ�te suivante insert into classe values ('P107'), Que remarquez-vous ?
--L'autorisation INSERT a �t� refus�e sur l'objet 'classe', base de donn�es 'ecole', sch�ma 'dbo'

--8.	Accorder � l�utilisateur �user1� la permission d�ins�rer des donn�es dans la table classe.
grant  insert on classe to user1

--10.	Ex�cuter la requ�te suivante : select * from eleve, Que remarquez-vous ?
--L'autorisation SELECT a �t� refus�e sur l'objet 'eleve', base de donn�es 'ecole', sch�ma 'dbo'.

--11.	Retirer le droit d�ins�rer des donn�es dans la table classe pour l�utilisateur �user1�
revoke insert on classe from user1

--12.	Cr�er une connexion �log2� avec le mot de passe �DBgroup2@�
create login log2 with password='DBgroup2@'

--13.	Ajouter dans la base de donn�es �ecole� un utilisateur �user2� pour la connexion �log2�.
create user user2 for login log2

--14.	Accorder � l�utilisateur �user1� la permission d�acc�der aux donn�es de la table classe avec 
--l�option de passer ce droit � d�autre utilisateurs
grant  select on classe to user1 WITH GRANT OPTION;

--16.	V�rifier si l�utilisateur �user2� peut acc�der aux donn�es de la table classe. Que remarquez-vous ?
-- Oui l�utilisateur �user2� peut acc�der aux donn�es de la table classe

--17.	Retirer le droit de SELECT � l�utilisateur �user1� avec : Revoke select on classe to user1; 
--Que remarquez-vous ?  Il faut sp�cifier l'option CASCADE.
Revoke  select on classe to user1 ;
Revoke  select on classe to user1 cascade;

--19.	Cr�er une connexion �log3� avec le mot de passe �DBgroup3@� et ajouter dans la base de donn�es �TP5� 
--un utilisateur �user3� pour la connexion �log3�.
use tp5ex1
create login log3 with password='DBgroup3@'
create user user3 for login log3

--20.	Accorder � l�utilisateur �user3� la permission de modifier la colonne salary de la table employee.
grant update(salary) on employee to user3

--23. Effectuer une sauvegarde de la base de donn�es ecole, puis supprimer cette derni�re avec drop et 
--essayer de faire d�une restauration.

backup database ecole to disk= 'ecolebackup.bak';
drop database ecole;
RESTORE database ecole from disk = 'ecolebackup.bak';