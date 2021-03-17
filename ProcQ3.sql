CREATE OR REPLACE PROCEDURE launchOrderWithDiscount
            (numCom IN COMMANDE.N_COMMANDE%type,
             dateCom IN COMMANDE.DATE_COMMANDE%TYPE,
             reg IN COMMANDE.REGLE%TYPE,
             idClient IN COMMANDE.ID_CLIENT%type,
             idProduit IN  ARRAY_OF_VARCHAR,
             quant IN ARRAY_OF_INT,
             remise IN INT)
AS
BEGIN
    launchOrder(numCom,dateCom,reg,idClient,idProduit,quant, remise);
END;

BEGIN
    launchOrderWithDiscount(723, '01/FEB/2021', 0, 2, ARRAY_OF_VARCHAR('A01', 'A02'), ARRAY_OF_INT(5, 3), 10);
end;