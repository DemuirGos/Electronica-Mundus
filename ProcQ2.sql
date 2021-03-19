CREATE OR REPLACE PROCEDURE launchOrder
            (numCom IN COMMANDE.N_COMMANDE%type,
             dateCom IN COMMANDE.DATE_COMMANDE%TYPE,
             dateLiv IN COMMANDE.DATE_LIVRAISON%TYPE,
             reg IN COMMANDE.REGLE%TYPE,
             idClient IN COMMANDE.ID_CLIENT%type,
             idProduit IN  ARRAY_OF_VARCHAR,
             quant IN ARRAY_OF_INT,
             remise IN NUMBER DEFAULT 0)
AS
BEGIN
    INSERT INTO COMMANDE VALUES (numCom, dateCom, reg, idCLient, 0, 0, dateLiv, 0);
    FOR i IN 1..idProduit.COUNT LOOP
        addProd(numCom, idProduit(i), quant(i), remise);
    END LOOP;

    UPDATEORDER(numCom);
END;