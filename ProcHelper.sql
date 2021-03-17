CREATE OR REPLACE PROCEDURE addProd
(numCom IN COMMANDE.N_COMMANDE%type,
 idProduit IN CATALOGUE.REF%TYPE,
 quant IN INT,
 remise IN NUMBER DEFAULT 0)
AS
    Price NUMBER;
    Tvaf   NUMBER;
    Montant_HT NUMBER;
    Montant_TTC NUMBER;
BEGIN
    SELECT PU, TVA INTO Price, Tvaf FROM CATALOGUE WHERE REF = idProduit;
    Montant_HT := Price * quant;
    Montant_TTC := Montant_HT * (1 + Tvaf / 100) * (1 - remise / 100);
    INSERT INTO PRODUITCOMMANDES (N_COMMANDE, REF_CATALOGUE, QUANTITE, MONTANTHT, MONTANTTTC)
    VALUES (numCom, idProduit, quant, Montant_HT, MONTANT_TTC);
END;
