CREATE OR REPLACE FUNCTION nbrDeCommandeClient (
    idClient IN NUMBER
)
RETURN NUMBER
AS
    total NUMBER;
BEGIN 
   SELECT Count(*)
   into total
   From Commande
   WHERE idClient = id_client;   
   RETURN total;
END;
