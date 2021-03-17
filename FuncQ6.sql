CREATE OR REPLACE FUNCTION CAdeProduit (idProduit IN VARCHAR2)
RETURN NUMBER
AS
    Prix NUMBER := 0;
    Quantite NUMBER := 0;
    TYPE PROD_DATA IS RECORD (quant ProduitCommandes.quantite%type, montHt ProduitCommandes.montantHT%type);

    fetchedData PROD_DATA;
    CURSOR prodCurs IS
        SELECT QUANTITE, MONTANTHT From ProduitCommandes WHERE REF_CATALOGUE = idProduit;
BEGIN
    OPEN prodCurs;
    LOOP
        FETCH prodCurs INTO fetchedData;
        EXIT WHEN prodCurs%NOTFOUND;
        Quantite := Quantite + fetchedData.quant;
        Prix     := fetchedData.montHt;
    END LOOP;
    close prodCurs;
    Return Quantite * Prix;
END;