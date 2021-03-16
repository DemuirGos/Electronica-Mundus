INSERT ALL
    INTO Region VALUES (1, 'Tanger-Tetouan-Al Hoceima')
    INTO Region VALUES (2, 'Region de l Oriental')
    INTO Region VALUES (3, 'Region de Fes-Meknes')
    INTO Region VALUES (4, 'Region de Rabat-Sale-Kenitra')
    INTO Region VALUES (5, 'Region de Beni Mella-Khenifra')
    INTO Region VALUES (6, 'Region de Casablanca-Settat')
    INTO Region VALUES (7, 'Region de Marrakech-Safi')
SELECT 1 FROM DUAL;

INSERT ALL
    INTO Client VALUES (1, 'BENTAJER', 'Mhannech II, Tetouan', 1, 'ahmed@mail.com', TO_DATE('2/11/2019', 'DD/MM/YYYY'))
    INTO Client VALUES (2, 'ESSEGHIRI', 'Res Naoufal app 8, Maarif, Casablanca', 2, 'youssef@mail.com', TO_DATE('27/10/2018', 'DD/MM/YYYY'))
    INTO Client VALUES (3, 'Houty', 'Settat', 2, 'karim@mail.com', TO_DATE('20/11/2018', 'DD/MM/YYYY'))
SELECT 1 FROM DUAL;

INSERT ALL
    INTO Categorie VALUES (1, 'RAM')
    INTO Categorie VALUES (2, 'DISQUE DUR EXTERNE')
    INTO Categorie VALUES (3, 'DISQUE DUR INTERNE')
    INTO Categorie VALUES (4, 'CARTE SON')
    INTO Categorie VALUES (5, 'CARTE GRAPHIQUE')
SELECT 1 FROM DUAL;

INSERT ALL
    INTO Famille VALUES(1, 'MEMOIRE')
    INTO Famille VALUES (2, 'CARTE')
    INTO Famille VALUES (3, 'DISQUE')
SELECT 1 FROM DUAL;

INSERT ALL
    INTO Catalogue VALUES ('A01', 'Barrette Memoire 2Go', 1, 1, 150, 12)
    INTO Catalogue VALUES ('A02', 'Barrette Memoire 4Go', 1, 1, 240, 12)
    INTO Catalogue VALUES ('B15', 'Carte Graphique AMD Radeon RX 570 Pulse, 4Go', 5, 2, 2349, 20)
    INTO Catalogue VALUES ('A11', 'Carte Son ASUS Xonar DG', 4, 2, 750, 12)
    INTO Catalogue VALUES ('C80', 'Disque externe Toshiba usb 3.0 1000Go', 2, 3, 546, 33)
SELECT 1 FROM DUAL;

INSERT INTO Commande
VALUES
    (886, TO_DATE('1/2/2019', 'DD/MM/YYYY'), 1, 2);

INSERT ALL
    INTO ProduitCommandes VALUES (1, 886, 'A01', 10)
    INTO ProduitCommandes VALUES (2, 886, 'A02', 2)
    INTO ProduitCommandes VALUES (3, 886, 'B15', 1)
SELECT 1 FROM DUAL;
