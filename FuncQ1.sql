CREATE OR REPLACE FUNCTION sommeCommandesDe (
    idClient IN NUMBER
)
RETURN number IS 
   total number := 0; 
BEGIN 
   SELECT SUM(montantTTC)
   into total
   From Commande
   WHERE id_client = idClient
   RETURN total;
END; 

DECLARE 
    clientName Client.nom%type
CREATE OR REPLACE PROCEDURE getSommeCommandesDe (
    idClient IN NUMBER
)
AS
BEGIN 
    Select nom into clientName from Client where id_client = idClient;
    DBMS_OUTPUT.PUT_LINE(   "le Montant totale des commande de " 
                            || nom
                            || "est : "
                            || sommeCommandesDe(idClient));
END; 