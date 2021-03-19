CREATE OR REPLACE PROCEDURE launchOrderWithDiscount
            (numCom IN COMMANDE.N_COMMANDE%type,
             dateCom IN COMMANDE.DATE_COMMANDE%TYPE,
             dateLiv IN COMMANDE.DATE_LIVRAISON%TYPE,
             reg IN COMMANDE.REGLE%TYPE,
             idClient IN COMMANDE.ID_CLIENT%type,
             idProduit IN  ARRAY_OF_VARCHAR,
             quant IN ARRAY_OF_INT,
             remise IN INT)
AS
BEGIN
    launchOrder(numCom,
                dateCom,
                dateLiv,
                reg,
                idClient,
                idProduit,
                quant, 
                remise);
END;
