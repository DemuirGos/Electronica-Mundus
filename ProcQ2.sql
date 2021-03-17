CREATE OR REPLACE TYPE ARRAY_OF_VARCHAR IS VARRAY(100) OF VARCHAR2(255);
CREATE OR REPLACE TYPE ARRAY_OF_INT IS VARRAY(100) OF INT;
DECLARE 
    Price NUMBER;
    TVA   NUMBER;
    MontantHT NUMBER;
    TotalHT NUMBER;
    TotalTTC NUMBER;
CREATE OR REPLACE PROCEDURE launchOrder
            (numCom IN COMMANDE.N_COMMANDE%type,
             dateCom IN COMMANDE.DATE_COMMANDE%TYPE,
             reg IN COMMANDE.REGLE%TYPE,
             idClient IN COMMANDE.ID_CLIENT%type,
             idProduit IN  ARRAY_OF_VARCHAR,
             quant IN ARRAY_OF_INT,
             remise IN NUMBER DEFAULT 0)
AS
BEGIN
    TotalHT := 0;
    TotalTTC := 0;
    FOR i IN 1..idProduit.COUNT LOOP
        SELECT montant, tva INTO Price,TVA FROM Catalogue WHERE ref = idProduit(i);
        MontantHT := Price * quant(i);
        INSERT INTO PRODUITCOMMANDES VALUES (numCom, idProduit(i), quant(i), MontantHT, MontantHT * (1 + TVA));
        TotalTTC = Total + MontantHT * (1 + TVA);
        TotalHT = Total + MontantHT;
    END LOOP;
    INSERT INTO COMMANDE VALUES (numCom, dateCom, reg, idCLient, TotalHT, TotalTTC - remise);
END;
