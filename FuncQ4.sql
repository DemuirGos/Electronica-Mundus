CREATE OR REPLACE FUNCTION nbrDeArticlesCategorie (
    idCategorie IN NUMBER
)
RETURN NUMBER
AS
    total NUMBER;
BEGIN 
   SELECT Count(*)
   into total
   From Catalogue
   WHERE id_categorie = idCategorie;
   RETURN total;
END;