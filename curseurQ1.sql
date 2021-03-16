DECLARE
    prodId CATALOGUE.Ref%type;
    CURSOR prodCurs IS
        SELECT * FROM CATALOGUE WHERE REF = prodId;
BEGIN
    prodId :=: prodId;
    FOR prod IN prodCurs
    LOOP
         DBMS_OUTPUT.PUT_LINE(prod.REF || ' | ' || prod.LIBELLE || ' | ' || prod.ID_CATEGORIE || ' | ' || prod.ID_FAMILLE || ' | ' || prod.PU || ' | ' || prod.TVA);
    END LOOP;
END;