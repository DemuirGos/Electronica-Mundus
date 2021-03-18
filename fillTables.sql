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
    INTO Client VALUES (1, 
                        'BENTAJER', 
                        'Mhannech II,
                        Tetouan', 
                        1, 
                        'ahmed@mail.com',
                        TO_DATE('2/11/2019', 'DD/MM/YYYY'),
                       'A passé une grosse commande en janvier 2018 ; depuis, plus rien. Penser à reprendre contact')
    INTO Client VALUES (2,
                        'ESSEGHIRI',
                        'Res Naoufal app 8,
                        Maarif, Casablanca',
                        2,
                        'youssef@mail.com',
                        TO_DATE('27/10/2018', 'DD/MM/YYYY'),
                        'Client contactée grâce à M. Houty de Casablanca. Remise de 10% sur la dernière commande suite à un retard d’envoi.')
    INTO Client VALUES (3, 
                        'Belmir',
                        'Tetouan',
                        2, 
                        'karim@mail.com', 
                        TO_DATE('20/11/2018', 'DD/MM/YYYY'),
                        'Client fidèle qui passe des commandes régulièrement (environ une par mois).')
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
    (886, TO_DATE('1/2/2019', 'DD/MM/YYYY'), 1, 1, 4329.00, 5036.4, TO_DATE('10/2/2019', 'DD/MM/YYYY'));

INSERT ALL
    INTO ProduitCommandes (N_COMMANDE, REF_CATALOGUE, QUANTITE, MONTANTHT, MONTANTTTC) VALUES (886, 'A01', 10, 1500, 1680)
    INTO ProduitCommandes (N_COMMANDE, REF_CATALOGUE, QUANTITE, MONTANTHT, MONTANTTTC) VALUES (886, 'A02', 2, 480, 537.6)
    INTO ProduitCommandes (N_COMMANDE, REF_CATALOGUE, QUANTITE, MONTANTHT, MONTANTTTC) VALUES (886, 'B15', 1, 2349, 2818.8)
SELECT 1 FROM DUAL;
