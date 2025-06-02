-- Liste des clients dont le nom contient une seule fois la lettre A
SELECT Nom
FROM Clients
WHERE Nom LIKE "%a%" AND  Nom NOT LIKE "%a%a%";

-- Contient deux occurrences de la lettre A

SELECT count(*)
FROM Clients
WHERE  Nom  LIKE "%A%A%";


-- Liste des produits qui contiennent "TV" (deux possibilités avec LIKE)
SELECT count(*)
FROM Produits
WHERE NomProduit LIKE "%TV%";

-- Avec REGEXP
SELECT count(*)
FROM Produits
WHERE NomProduit REGEXP "TV";


-- Liste des produits dont le nom commence par la lettre "D"
SELECT count(*)
FROM Produits
WHERE NomProduit LIKE "D%";


-- Avec une expression régulière
SELECT count(*)
FROM Produits
WHERE NomProduit REGEXP "^D";


-- Liste des produits qui se terminent par "M"
SELECT count(*)
FROM Produits
WHERE NomProduit LIKE "%M";

-- Avec une expression régulière
SELECT count(*)
FROM Produits
WHERE NomProduit REGEXP "M$";


-- Liste des clients dont le numéro contient "05" ou "04"
SELECT count(*)
FROM Clients
WHERE NumeroTelephone LIKE "%05%" OR NumeroTelephone LIKE "%04%" ;

-- Avec REGEXP
SELECT count(*)
FROM Clients
WHERE NumeroTelephone REGEXP "05|04" ;

-- Avec REGEXP
SELECT *
FROM Clients
WHERE NumeroTelephone REGEXP "05|04|09|20" ;


-- Avec LIKE
SELECT *
FROM Clients
WHERE NumeroTelephone LIKE "05%" OR NumeroTelephone LIKE "%94";

-- Avec REGEXP
SELECT *
FROM Clients
WHERE NumeroTelephone REGEXP "^05|94$";


-- Avec LIKE (underscore)
SELECT count(*)
FROM Clients
WHERE Nom LIKE "%R_a%";

-- Avec REGEXP
SELECT *
FROM Clients
WHERE Nom REGEXP "R.A";



-- Avec LIKE
SELECT *
FROM Clients
WHERE Nom LIKE "R%A";

-- Avec REGEXP
SELECT *
FROM Clients
WHERE Nom REGEXP "R.*A$";


-- Liste des clients dont le nom contient "it" ou "ie" ou "il" ou "is" 
SELECT *
FROM Clients
WHERE Nom LIKE "%ie%" OR Nom LIKE "%it%" OR Nom LIKE "%il%" OR Nom LIKE "%is%";

-- Liste des clients dont le nom contient n'importe quelle lettre de 'a' à 'g' suivie de 'l'
SELECT *
FROM Clients
WHERE Nom REGEXP "i[a-g]";

SELECT *
FROM Clients
WHERE Nom REGEXP "[etls]i";


-- Donner la liste des 10 premiers clients par ordre alphabétique
SELECT *
FROM Clients
ORDER BY Nom
LIMIT 10000;


-- Donner la liste des 10 produits les plus chers
SELECT *
FROM Produits
ORDER BY PrixUnitaire DESC 
LIMIT 10;

-- Donner la liste des 10 produits les plus moins
SELECT *
FROM Produits
ORDER BY PrixUnitaire  
LIMIT 10;



-- Question: Combien y a-t-il de clients dans la base de données ?
SELECT COUNT(*) AS "NombreClient"
FROM Clients;

SELECT COUNT(ClientID) AS "NombreClient"
FROM Clients;



-- Calculer la somme totale des ventes dans la table "Ventes".
SELECT SUM(MontantTotal) AS Somme_CA
FROM Ventes;



-- Déterminer la moyenne des ventes.
SELECT AVG(MontantTotal) AS AVG_CA
FROM Ventes;


-- Les fonctions MIN() et MAX() permettent de trouver la valeur minimale et maximale dans une colonne, respectivement.
SELECT MIN(MontantTotal) AS MIN_CA
FROM Ventes;

SELECT MAX(MontantTotal) AS MIN_CA
FROM Ventes;
-- Quel est le produit le moins cher ? Quel est le produit le plus cher ?
SELECT MIN(MontantTotal) AS Minimum, MAX(MontantTotal) AS Maximum
FROM Ventes;

SELECT MIN(PrixUnitaire) AS Minimum, MAX(PrixUnitaire) AS Maximum
FROM Produits;


-- La fonction SUM(DISTINCT) permet de calculer la somme des valeurs uniques dans une colonne.
SELECT SUM(DISTINCT MontantTotal) AS Somme_CA
FROM Ventes;
-- Exemple: Calculer la somme totale des ventes uniques dans la table "Ventes".


-- Calculer la moyenne des ventes uniques.
SELECT AVG(DISTINCT MontantTotal) AS MoyenneDist
FROM Ventes;


--  Calculer la somme des ventes par employé.
SELECT EmployeID, SUM(MontantTotal) AS CA_Total
FROM Ventes
GROUP BY EmployeID;

-- Compter le nombre de ventes par employé.
SELECT EmployeID, COUNT(VenteID) AS CA_Total
FROM Ventes
GROUP BY EmployeID;

--  Déterminer la somme des ventes par année.
SELECT EXTRACT(YEAR FROM DateVente) as Annee, SUM(MontantTotal) as MntTot
FROM Ventes
GROUP BY Annee
ORDER BY MntTot DESC;

SELECT YEAR(DateVente)  as Annee, SUM(MontantTotal) as MntTot
FROM Ventes
GROUP BY Annee
ORDER BY MntTot DESC;

-- Quelle est la moyenne des ventes par année et par employé ?
SELECT YEAR(DateVente) as Annee, EmployeID, AVG(MontantTotal) as MoyenneCA
FROM Ventes
GROUP BY Annee, EmployeID;


--  Donner la liste des employés dont la moyenne des ventes est supérieure à 1000 euros.

SELECT YEAR(DateVente) as Annee, EmployeID, AVG(MontantTotal) as MoyenneCA
FROM Ventes
GROUP BY Annee, EmployeID
HAVING MoyenneCA > 1000;

SELECT YEAR(DateVente) as Annee, EmployeID, AVG(MontantTotal) as MoyenneCA
FROM Ventes
WHERE MontantTotal > 1000
GROUP BY Annee, EmployeID
;

--  Donner la liste des 5 employés ayant la somme des ventes la plus élevée.
SELECT EmployeID, SUM(MontantTotal) AS CA_Total
FROM Ventes
GROUP BY EmployeID
ORDER BY CA_Total
LIMIT 5;