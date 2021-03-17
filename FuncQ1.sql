CREATE OR REPLACE FUNCTION sommeCommandesDe (idClient IN NUMBER)
RETURN NUMBER
AS
    total NUMBER := 0;
BEGIN 
   SELECT SUM(montantTTC)
   into total
   From Commande
   WHERE id_client = idClient;
   RETURN total;
END; 


CREATE OR REPLACE PROCEDURE getSommeCommandesDe (idClient IN NUMBER)
AS
    clientName Client.nom%type;
BEGIN
    Select nom into clientName from Client where id_client = idClient;
    DBMS_OUTPUT.PUT_LINE(   'le Montant totale des commande de '
                            || clientName
                            || ' est : '
                            || sommeCommandesDe(idClient));
END;
