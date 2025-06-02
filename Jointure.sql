-- Exercice: Donner la liste des 5 employés ayant la somme des ventes la plus élevée.
SELECT EmployeID, SUM(MontantTotal) AS CA_Total
FROM Ventes
GROUP BY EmployeID
ORDER BY CA_Total DESC
LIMIT 5;

-- Question: Donner pour chaque vente le nom et le prénom de l'employé qui a réalisé la vente

-- Première approche produit cartésien
SELECT *
FROM Ventes, Employes
WHERE Ventes.EmployeID = Employes.EmployeID;


SELECT VenteID, Ventes.EmployeID, Nom, Prenom
FROM Ventes, Employes
WHERE Ventes.EmployeID = Employes.EmployeID;


-- Donner pour chaque vente le nom et le prénom de l'employé qui a réalisé la vente

SELECT VenteID, nom, prenom
FROM Ventes 
INNER JOIN Employes ON Ventes.EmployeID=Employes.EmployeID;

-- Utilisation de USING
SELECT VenteID, nom, prenom
FROM Ventes 
INNER JOIN Employes USING(EmployeID);

-- Utilisation de JOIN
SELECT VenteID, nom, prenom
FROM Ventes 
JOIN Employes USING(EmployeID);

-- Utilisation de JOIN
SELECT VenteID, nom, prenom
FROM Ventes AS v
JOIN Employes USING(EmployeID);



SELECT VenteID, nom, prenom
FROM Ventes AS ve
JOIN Employes AS em ON ve.EmployeID=em.EmployeID;

SELECT *
FROM Ventes AS ve
JOIN Employes AS em ON ve.EmployeID=em.EmployeID;



SELECT *
FROM Ventes AS ve
JOIN Employes AS em USING(EmployeID);


SELECT ve.EmployeID
FROM Ventes AS ve
JOIN Employes AS em ON ve.EmployeID=em.EmployeID;


-- Exercice: Donner pour chaque produit de la base de données le nom et l'adresse de son fournisseur
SELECT ProduitID, NomFournisseur, adresse
FROM Fournisseurs fo 
JOIN Produits pr USING(FournisseurID);

SELECT ProduitID,NomProduit, NomFournisseur, adresse
FROM Fournisseurs fo 
JOIN Produits pr ON fo.FournisseurID = pr.ProduitID;





-- Donner le nom et prénom des employés ayant réalisé la somme des ventes les plus élevées

SELECT EmployeID, Nom, Prenom, SUM(MontantTotal) AS CA
FROM Employes JOIN Ventes USING(EmployeID)
GROUP BY EmployeID, Nom, Prenom
ORDER BY CA DESC;



-- Exercice donner pour chaque client le nom, l'adresse ainsi que le nombre d'achat réalisé
SELECT ClientID, Nom, Adresse, COUNT(VenteID) AS NbAchat
FROM Clients JOIN Ventes USING(ClientID)
GROUP BY  ClientID, Nom, Adresse
ORDER BY NbAchat DESC;


-- Question donner pour chaque employé, le nom, le prénom et le nombre de vente réalisé (il faut conserver dans la base les employés qui ont des ventes nulles)
SELECT EmployeID, Nom, Prenom, COUNT(VenteID) as NbVente
FROM Employes 
LEFT JOIN Ventes USING (EmployeID)
GROUP BY EmployeID, Nom, Prenom
ORDER BY NbVente;


SELECT EmployeID, Nom, Prenom, COUNT(VenteID) as NbVente
FROM Employes 
JOIN Ventes USING (EmployeID)
GROUP BY EmployeID, Nom, Prenom
ORDER BY NbVente;



-- Donner pour chaque fournisseur son nom, son email et le nombre de produits fournis (laisser des fournisseurs qui n'ont aucun produit)
SELECT nomFournisseur, email, COUNT(ProduitID) as nbproduit
FROM Fournisseurs f 
LEFT JOIN Produits USING (FournisseurID)
GROUP BY nomFournisseur, email
ORDER BY nbproduit;


SELECT nomFournisseur, email, COUNT(ProduitID) as nbproduit
FROM Fournisseurs f 
JOIN Produits USING (FournisseurID)
GROUP BY nomFournisseur, email
ORDER BY nbproduit;



-- Donner le nom, le prénom et la moyenne des ventes par client (conservez la liste des clients qui n'ont acheté aucun produit)

SELECT Nom, Prenom, AVG(MontantTotal) as CAAvg
FROM Clients
LEFT JOIN Ventes USING(ClientID)
GROUP BY Nom, Prenom;


-- Remplacez dans la requête précédente les valeurs NULL par 0

-- COALESCE
SELECT Nom, Prenom, COALESCE(AVG(MontantTotal),0) as CAAvg
FROM Clients
LEFT JOIN Ventes USING(ClientID)
GROUP BY Nom, Prenom;


SELECT Nom, Prenom, ROUND(COALESCE(AVG(MontantTotal),0),2) as CAAvg
FROM Clients
LEFT JOIN Ventes USING(ClientID)
GROUP BY Nom, Prenom;

SELECT Nom, Prenom, ROUND(COALESCE(AVG(MontantTotal),0),2) as CAAvg
FROM Ventes
RIGHT JOIN Clients USING(ClientID)
GROUP BY Nom, Prenom;


-- Exercice: Donner le nom, le prénom et la somme des achats réalisés par chaque client, et affichez zéro si le montant des achats est nul
SELECT ClientID,Nom, Prenom, COALESCE(SUM(MontantTotal),0) as CA
FROM Clients 
LEFT JOIN Ventes USING(ClientID)
GROUP BY ClientID, Nom, Prenom;



-- Refaire les exercices précédents en utilisant RIGHT JOIN

SELECT ClientID,Nom, Prenom, COALESCE(SUM(MontantTotal),0) as CA
FROM Ventes 
RIGHT JOIN Clients USING(ClientID)
GROUP BY ClientID, Nom, Prenom;


-- Créez une vue des ventes de l'année 2021`
CREATE VIEW Vente2021 AS 
SELECT *
FROM Ventes
WHERE YEAR(DateVente) = 2021;

SELECT *
FROM Vente2021;

-- Quelle est la liste des clients qui ont réalisé plus de 2 achats en 2021
SELECT ClientID, Nom, Prenom, COUNT(VenteID) as NbAchat
FROM Clients 
LEFT JOIN Vente2021 USING(ClientID)
GROUP BY ClientID
HAVING NbAchat > 1;


-- Quelle est la liste des employés qui ont les ventes moyennes supérieures à 500 en 2021?
SELECT EmployeID, Nom, Prenom, AVG(MontantTotal) as AvgVente
FROM Employes 
LEFT JOIN Vente2021 USING(EmployeID)
GROUP BY EmployeID, Nom, Prenom
HAVING AvgVente >500;

-- Créez une vue contenant les produits dont le prix est supérieur à 500 euros
CREATE VIEW ProduitSup500 AS
SELECT *
FROM Produits
WHERE PrixUnitaire >500;


-- Liste des clients qui n'ont réalisé aucun achat

SELECT *
FROM Clients
WHERE ClientID NOT IN (SELECT ClientID FROM Ventes);

-- Liste des employés au moins une vente
SELECT *
FROM Employes
WHERE EmployeID IN (SELECT EmployeID FROM Ventes);
