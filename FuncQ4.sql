CREATE OR REPLACE FUNCTION nbrDeArticles (
    idCategorie IN NUMBER
)
RETURN NUMBER AS total
BEGIN 
   SELECT Count(*)
   into total
   From Catalogue
   WHERE id_categorie = idCategorie;
   RETURN total;
END; 