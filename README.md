# 📊 Projet SQL — Création, Manipulation et Analyse Relationnelle

Ce projet illustre ma maîtrise des bases de données relationnelles à travers une série d'exercices complets en SQL. Il couvre toutes les étapes de manipulation de données : **création de tables**, **requêtes de sélection**, **agrégation**, **expressions régulières**, **jointures**, et **création de vues**.

L'objectif est de montrer ma montée en compétences en SQL à travers des cas concrets inspirés d'un environnement métier (clients, produits, ventes, fournisseurs, employés).

---

## 🎯 Objectifs pédagogiques

- Modéliser une base de données relationnelle cohérente
- Maîtriser les requêtes de base (`SELECT`, `WHERE`, `ORDER BY`, `LIKE`)
- Réaliser des agrégations statistiques (`SUM`, `AVG`, `GROUP BY`, `HAVING`)
- Utiliser des **expressions régulières** et des conditions avancées
- Exploiter les **jointures multi-tables** (`INNER`, `LEFT`, `RIGHT JOIN`)
- Créer des **vues SQL** et structurer des analyses métiers

---

## 📁 Contenu du projet

| Fichier                   | Description technique |
|--------------------------|------------------------|
| `Creation de table.sql`  | Création des tables et insertion de données |
| `Selection.sql`          | Requêtes simples, filtres, recherches textuelles |
| `Agregation.sql`         | Statistiques, groupements, expressions régulières |
| `Jointure.sql`           | Requêtes multi-tables, vues, jointures avancées |

---

## 🏗️ Schéma relationnel utilisé

Le projet repose sur un mini-datawarehouse simulant une entreprise :

- **Clients** : informations personnelles, adresse, contact
- **Produits** : nom, description, prix
- **Ventes** : date, client, produit, employé, montant
- **Fournisseurs** : adresse, email, produits associés
- **Employés** : vendeurs ou responsables associés aux ventes

Toutes les relations sont définies par des clés primaires / étrangères pour garantir l’intégrité des données.

---

## 🧪 Quelques exemples de requêtes réalisées

### 🔹 Création de tables (fichier : `Creation de table.sql`)

```sql
CREATE TABLE Clients (
    ClientID INT PRIMARY KEY,
    Nom VARCHAR(50),
    Prenom VARCHAR(50),
    ...
);
```

---

### 🔹 Sélections conditionnelles (fichier : `Selection.sql`)

- Produits dont le prix est supérieur à 200€ :

```sql
SELECT * FROM Produits
WHERE PrixUnitaire > 200
ORDER BY NomProduit;
```

- Clients dont le nom contient "on" :

```sql
SELECT * FROM Clients
WHERE Nom LIKE '%on%';
```

---

### 🔹 Statistiques avancées (fichier : `Agregation.sql`)

- Moyenne des ventes par employé et par an :

```sql
SELECT YEAR(DateVente) as Annee, EmployeID, AVG(MontantTotal) as MoyenneCA
FROM Ventes
GROUP BY Annee, EmployeID;
```

- Produits commençant par "D" (REGEXP) :

```sql
SELECT * FROM Produits
WHERE NomProduit REGEXP '^D';
```

---

### 🔹 Requêtes multi-tables (fichier : `Jointure.sql`)

- Associer chaque vente au nom de l’employé concerné :

```sql
SELECT VenteID, Nom, Prenom
FROM Ventes
JOIN Employes USING (EmployeID);
```

- Nombre de ventes par employé (même ceux qui n'ont rien vendu) :

```sql
SELECT EmployeID, Nom, Prenom, COUNT(VenteID) as NbVente
FROM Employes
LEFT JOIN Ventes USING (EmployeID)
GROUP BY EmployeID;
```

- Clients ayant réalisé plus de 2 achats en 2021 (vue + `HAVING`) :

```sql
CREATE VIEW Vente2021 AS
SELECT * FROM Ventes WHERE YEAR(DateVente) = 2021;

SELECT ClientID, Nom, Prenom, COUNT(VenteID) as NbAchat
FROM Clients
LEFT JOIN Vente2021 USING(ClientID)
GROUP BY ClientID
HAVING NbAchat > 2;
```

---

## 💼 Ce que démontre ce projet

✅ Capacité à structurer un schéma relationnel clair  
✅ Maîtrise des requêtes SQL avancées dans un contexte métier  
✅ Compréhension des relations entre entités (modèle relationnel)  
✅ Utilisation propre de `JOIN`, `GROUP BY`, `HAVING`, `REGEXP`, `VIEWS`  
✅ Capacité à **poser des questions pertinentes aux données**

---

## 🧰 Outils utilisés

- SQLite Studio (tests locaux)
- VS Code (édition et exécution de scripts SQL)
- PostgreSQL / DBeaver (exportable)

--

## 📌 Recommandé pour

- Portfolio Data Analyst / BI
- Démonstration de compétences SQL pour candidatures
- Présentation lors d'entretien technique

