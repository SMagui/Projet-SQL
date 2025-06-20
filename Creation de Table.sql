-- Création de la table "Clients"
CREATE TABLE Clients (
    ClientID INT PRIMARY KEY,
    Nom VARCHAR(50),
    Prenom VARCHAR(50),
    Adresse VARCHAR(100),
    Email VARCHAR(100),
    NumeroTelephone VARCHAR(15)
);

-- Création de la table "Produits"
CREATE TABLE Produits (
    ProduitID INT PRIMARY KEY,
    NomProduit VARCHAR(50),
    Description TEXT,
    PrixUnitaire DECIMAL(10, 2)
);

-- Création de la table "Ventes"
CREATE TABLE Ventes (
    VenteID INT PRIMARY KEY,
    DateVente DATE,
    ClientID INT REFERENCES Clients(ClientID),
    ProduitID INT REFERENCES Produits(ProduitID),
    QuantiteVendue INT,
    MontantTotal DECIMAL(10, 2)
);

CREATE TABLE Fournisseurs (
	FournisseurID INT PRIMARY KEY,
    NomFournisseur VARCHAR(200),
    Adresse VARCHAR(100),
    Email VARCHAR(200),
    NumeroTelephone VARCHAR(200)
    ) ;
    
    CREATE TABLE Employes (
	EmployeID INT PRIMARY KEY,
    Nom VARCHAR(200),
    Prenom VARCHAR(200),
    Fonction VARCHAR(200),
    Email VARCHAR(200),
    NuméroTelephone VARCHAR(200)
    ) ;
    
-- Insertion de données de démonstration dans la table "Clients"
INSERT INTO Clients (ClientID, Nom, Prenom, Adresse, Email, NumeroTelephone)
VALUES
    (1, 'Doe', 'John', '123 Rue de la Demo', 'john.doe@email.com', '1234567890'),
    (2, 'Smith', 'Alice', '456 Avenue Exemple', 'alice.smith@email.com', '9876543210'),
    (3, 'Johnson', 'Bob', '789 Rue Test', 'bob.johnson@email.com', '5551234567'),
    (4, 'Garcia', 'Maria', '321 Elm Street', 'maria.garcia@email.com', '9998887777'),
    (5, 'Chen', 'Li', '555 Oak Avenue', 'li.chen@email.com', '1112223333');

-- Insertion de données de démonstration dans la table "Produits"
INSERT INTO Produits (ProduitID, NomProduit, Description, PrixUnitaire)
VALUES
    (1, 'Produit A', 'Description du Produit A', 10.99),
    (2, 'Produit B', 'Description du Produit B', 15.99),
    (3, 'Produit C', 'Description du Produit C', 8.49),
    (4, 'Produit D', 'Description du Produit D', 22.50),
    (5, 'Produit E', 'Description du Produit E', 12.75);

-- Insertion de données de démonstration dans la table "Ventes"
INSERT INTO Ventes (VenteID, DateVente, ClientID, ProduitID, QuantiteVendue, MontantTotal)
VALUES
    (1, '2023-01-15', 1, 1, 5, 54.95),
    (2, '2023-01-16', 2, 1, 3, 32.97),
    (3, '2023-01-17', 3, 2, 2, 31.98),
    (4, '2023-01-18', 4, 3, 4, 33.96),
    (5, '2023-01-19', 5, 4, 1, 22.50);