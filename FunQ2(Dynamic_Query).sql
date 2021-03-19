CREATE TYPE Tuple2 IS OBJECT (left NUMBER, right NUMBER);

CREATE OR REPLACE FUNCTION getClientWhere(where_clause IN VARCHAR2)
RETURN INT
AS
    result INT;
BEGIN
    EXECUTE IMMEDIATE 'SELECT id_client FROM Commande ' || where_clause
        INTO result;
    RETURN result;
END;

CREATE OR REPLACE FUNCTION MaxClient
RETURN INT
AS
    result INT;
BEGIN
    result := getClientWhere('WHERE (sommeCommandesDe(id_client) = SELECT MAX(sommeCommandesDe(id_client)) FROM Client)');
    RETURN result;
END;

CREATE OR REPLACE FUNCTION MinClient
RETURN INT
AS
    result INT;
BEGIN 
    result := getClientWhere('WHERE (sommeCommandesDe(id_client) = SELECT MIN(sommeCommandesDe(id_client)) FROM Client)');
    RETURN result;
END; 

CREATE OR REPLACE FUNCTION MinAndMaxClient
RETURN TUPLE2
AS
    result Tuple2;
BEGIN
    result := TUPLE2(MinClient(), MaxClient());
    RETURN result;
END;
