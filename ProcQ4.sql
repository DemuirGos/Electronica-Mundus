CREATE OR REPLACE PROCEDURE launchOrder
            (numCom IN COMMANDE.N_COMMANDE%type,
             dateCom IN COMMANDE.DATE_COMMANDE%TYPE,
             reg IN COMMANDE.REGLE%TYPE,
             idClient IN COMMANDE.ID_CLIENT%type,
             idProduit IN  ARRAY_OF_VARCHAR,
             quant IN ARRAY_OF_INT,
             remises IN ARRAY_OF_INT)
AS
    MontantHT NUMBER;
    TotalHT NUMBER;
    TotalTTC NUMBER;
BEGIN
    INSERT INTO COMMANDE VALUES (numCom, dateCom, reg, idCLient, 0, 0);
    FOR i IN 1..idProduit.COUNT LOOP
        addProd(numCom, idProduit(i), quant(i), remises(i));
    END LOOP;

    SELECT SUM (MONTANTHT), SUM (MONTANTTTC)
    INTO TotalHT, TotalTTC FROM PRODUITCOMMANDES
    WHERE N_COMMANDE = numCom;

    UPDATE COMMANDE SET MONTANTHT = TotalHT, MONTANTTTC = TotalTTC WHERE N_COMMANDE = numCom;
END;