CREATE OR REPLACE FUNCTION nbrDeArticles (
    idClient IN NUMBER
)
RETURN NUMBER AS total
BEGIN 
   SELECT Count(*)
   into total
   From Commande
   WHERE idClient = id_client;   
   RETURN total;
END; 