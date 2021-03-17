CREATE OR REPLACE TYPE ARRAY_OF_VARCHAR IS VARRAY(100) OF VARCHAR2(255);
CREATE OR REPLACE TYPE ARRAY_OF_INT IS VARRAY(100) OF INT;

CREATE OR REPLACE PROCEDURE launchOrder
            (numCom IN COMMANDE.N_COMMANDE%type,
             dateCom IN COMMANDE.DATE_COMMANDE%TYPE,
             reg IN COMMANDE.REGLE%TYPE,
             idClient IN COMMANDE.ID_CLIENT%type,
             idProduit IN  ARRAY_OF_VARCHAR,
             quant IN ARRAY_OF_INT,
             remise IN NUMBER DEFAULT 0)
AS
    MontantHT NUMBER;
    TotalHT NUMBER;
    TotalTTC NUMBER;
BEGIN
    INSERT INTO COMMANDE VALUES (numCom, dateCom, reg, idCLient, 0, 0);
    FOR i IN 1..idProduit.COUNT LOOP
<<<<<<< HEAD
        addProd(numCom, idProduit(i), quant(i), remise);
    END LOOP;

    SELECT SUM (MONTANTHT), SUM (MONTANTTTC)
    INTO TotalHT, TotalTTC FROM PRODUITCOMMANDES
    WHERE N_COMMANDE = numCom;

    UPDATE COMMANDE SET MONTANTHT = TotalHT, MONTANTTTC = TotalTTC WHERE N_COMMANDE = numCom;
END;

=======
        SELECT montant, tva INTO Price,TVA FROM Catalogue WHERE ref = idProduit(i);
        MontantHT := Price * quant(i);
        INSERT INTO PRODUITCOMMANDES VALUES (numCom, idProduit(i), quant(i), MontantHT, MontantHT * (1 + TVA));
        TotalTTC = Total + MontantHT * (1 + TVA);
        TotalHT = Total + MontantHT;
    END LOOP;
    INSERT INTO COMMANDE VALUES (numCom, dateCom, reg, idCLient, TotalHT, TotalTTC - remise);
END;
>>>>>>> 08949aaf708b1e70af332175f61f2541652183d9
