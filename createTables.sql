alter session set current_schema = PROJET;

DROP TABLE Region;
CREATE TABLE Region
(
    id_region INT PRIMARY KEY,
    libelle   VARCHAR(100) NOT NULL
);

DROP TABLE Client;
CREATE TABLE Client
(
    id_client    INT PRIMARY KEY,
    nom          VARCHAR(50) NOT NULL,
    adresse      VARCHAR(100),
    id_region    INT    
        CONSTRAINT fk_id_region
            REFERENCES Region (id_region),
    email        VARCHAR(100),
    date_contact DATE,
    observations VARCHAR2 
);

DROP TABLE Categorie;
CREATE TABLE Categorie
(
    id_categorie INT PRIMARY KEY,
    libelle      VARCHAR(50) NOT NULL
);

DROP TABLE Famille;
CREATE TABLE Famille
(
    id_famille INT PRIMARY KEY,
    libelle    VARCHAR(50) NOT NULL
);

DROP TABLE Catalogue;
CREATE TABLE Catalogue
(
    ref          VARCHAR(10) PRIMARY KEY,
    libelle      VARCHAR(100) NOT NULL,
    id_categorie INT
        CONSTRAINT fk_id_categorie
            REFERENCES Region (id_region),
    id_famille   INT    
        CONSTRAINT fk_id_famille
            REFERENCES Famille(id_famille),
    pu           INT          NOT NULL,
    tva          INT          NOT NULL
);

DROP TABLE Commande;
CREATE TABLE Commande
(
    n_commande    INT PRIMARY KEY,
    date_commande DATE    NOT NULL,
    regle         NUMBER(1) NOT NULL,
    id_client     INT
        CONSTRAINT fk_id_client
            REFERENCES Client (id_client)
);

DROP TABLE ProduitCommandes;
CREATE TABLE ProduitCommandes
(
    id_produit    INT PRIMARY KEY,
    n_commande    INT     
        CONSTRAINT fk_n_commande
            REFERENCES Commande(n_commande),
    ref_catalogue VARCHAR(10)
        CONSTRAINT fk_ref_catalogue
            REFERENCES Catalogue(ref),
    quantite      INT
);
