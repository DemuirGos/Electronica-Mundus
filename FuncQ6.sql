DECLARE
    Prix NUMBER := 0;
    Quantite NUMBER := 0;  
CREATE OR REPLACE FUNCTION CAdeProduit (
    idProduit IN NUMBER
)
RETURN NUMBER AS total
BEGIN 
    DECLARE 
        CURSOR prodCom IS
            SELECT * From ProduitCommandes WHERE id_produit = idProduit ;
    BEGIN
        LOOP
            Quantite := Quantite + prodCom.quantite;
            Prix     := prodCom.montantHT;
        END LOOP;
    END
    total := Quantite * Prix;
    RETURN total;
END; 