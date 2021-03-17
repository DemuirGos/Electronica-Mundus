TYPE Tuple2 is record(left NUMBER, right NUMBER);



DECLARE 
    stmt VARCHAR2;
CREATE OR REPLACE FUNCTION getClientWhere(
    where_clause IN VARCHAR2
)
RETURN number IS 
   result INT := 0; 
BEGIN 
    stmt := "SELECT id_client INTO result into total FROM Commande" || where_clause || ";";
    EXECUTE IMMEDIATE stmt;
    RETURN result;
END; 



CREATE OR REPLACE FUNCTION MaxClient
RETURN number IS 
    result INT := 0; 
BEGIN 
    result := getClientWhere("
        WHERE sommeCommandesDe(id_client) = SELECT MAX(montantTTC) FROM Commande
    ")
    RETURN result;
END; 



CREATE OR REPLACE FUNCTION MinClient
RETURN number IS 
   result INT := 0; 
BEGIN 
    result := getClientWhere("
        WHERE sommeCommandesDe(id_client) = SELECT MIN(montantTTC) FROM Commande
    ")
    RETURN result;
END; 



CREATE OR REPLACE FUNCTION MinAndMaxClient
RETURN Tuple2 number AS result 
BEGIN 
    result.left  := MinClient()
    result.right := MaxClient()
    RETURN result;
END; 