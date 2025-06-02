

-- QUESTION 1: Donner la table complète des produits vendus par l'entreprise 
SELECT *
FROM Produits;

-- QUESTION 2: Donner la table complète des clients de l'entreprise
SELECT *
FROM Clients;



-- QUESTION 3: Donner le nom de tous les produits de la base de données
SELECT NomProduit
FROM Produits;


-- QUESTION 4: Donner le nom de tous les fournisseurs de la base de données
SELECT NomFournisseur
FROM Fournisseurs;


SELECT NomFournisseur, FournisseurID,Email, Adresse
FROM Fournisseurs;
 

-- QUESTION 5: Donner le nom et le prénom des employés de l'entreprise

SELECT Nom,prenom 
FROM Employes

-- QUESTION 6: Donner le nom, le prix et la description de tous les produits

SELECT Nomproduit, prixunitaire,Description
FROM Produits


-- QUESTION 7: Donner les différentes dates auxquelles des ventes ont été réalisées
SELECT DISTINCT *
FROM Ventes;

-- QUESTION 8: Donner les noms et prénoms distincts des employés de l'entreprise
SELECT DISTINCT Nom, Prenom
FROM Employes


-- Liste produit vendu 
SELECT *
FROM Produits
WHERE PrixUnitaire = 50;

-- Liste produit vendu est à > 200

SELECT *
FROM Produits
WHERE PrixUnitaire > 200;

-- Liste produit vendu est à <= 200
SELECT *
FROM Produits
WHERE PrixUnitaire <= 200;

-- Liste produit vendu compris et 50 et 100
SELECT *
FROM Produits
WHERE PrixUnitaire >=50 AND PrixUnitaire <=100;

-- QUESTION 9: Information sur le produit "Nike Air Max" 
SELECT *
FROM Produits
WHERE NomProduit = "Nike Air Max";

-- QUESTION 10: Donner la liste des produits du fournisseur numéro 13
SELECT *
FROM Produits
WHERE FournisseurID = 13;

-- Description des produits du fournisseur numéro 13
SELECT DescProduit
FROM Produits
WHERE FournisseurID = 13;




-- Liste des produits vendu par le fournisseur 13 ou par le fournisseur 11
SELECT *
FROM Produits
WHERE FournisseurID=13 OR FournisseurID=11


SELECT *
FROM Produits
WHERE FournisseurID IN (13, 15, 55, 45, 89, 88);


-- Sélectionner les ventes réalisées entre le 1er janvier 2021 et le 31 décembre 2023
SELECT *
FROM Ventes
WHERE dateVente BETWEEN "2021-01-10" AND "2021-03-31";



-- Nom des clients qui commencent par la lettre c
SELECT *
FROM Clients
WHERE Nom like "c%";

-- Nom des clients qui commencent par la lettre c et qui se termine par a
SELECT *
FROM Clients
WHERE Nom LIKE "c%a" ;

SELECT *
FROM Clients
WHERE Nom LIKE "c%" AND Prenom LIKE "%y";

-- Le nom contient la lettre n
SELECT *
FROM Clients
WHERE Nom LIKE "%n%";

-- Le nom contient  "on"
SELECT *
FROM Clients
WHERE Nom LIKE "%on%";

-- Donner la liste des produits qui commencent par 'a'
SELECT *
FROM Produits
WHERE Nomproduit LIKE "n%";

-- Donner la liste des produits qui contiennent la lettre 'a'
SELECT *
FROM Produits
WHERE Nomproduit LIKE "%a%";

-- Donner la liste des produits commençant par 'N' et finissant par 'x'

SELECT *
FROM Produits
WHERE Nomproduit LIKE "n%x";

-- Donner la liste des produits du moins coûteux au plus coûteux
SELECT *
FROM Produits
ORDER BY prixUnitaire ;
-- Donner la liste des produits du prix le plus élevé au prix le moins élevé
SELECT *
FROM Produits
ORDER BY prixUnitaire DESC;

-- Liste des employés ordre alphabétique le nom t décroissant prénom
SELECT *
FROM Employes
ORDER BY nom, prenom DESC;

-- La liste des produits dont le prix est supérieur à 200, résultat par alphabétqiue suivant le nom du produit
SELECT *
FROM Produits
WHERE PrixUnitaire >200
ORDER BY NomProduit;