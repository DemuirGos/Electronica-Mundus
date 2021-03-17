CREATE OR REPLACE FUNCTION CAdeEntreprise
RETURN NUMBER
AS
    total INT;
BEGIN 
    SELECT SUM(montantHT) 
    INTO total
    FROM Commande 
    WHERE extract(year from sysdate) = extract(year from date_commande);
    RETURN total;
END;