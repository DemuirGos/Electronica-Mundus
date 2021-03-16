CREATE OR REPLACE PROCEDURE sortByPu
AS
    CURSOR prodCurs IS
        SELECT * FROM CATALOGUE ORDER BY PU DESC;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Ref | Libelle | Famille | Categorie | PU | TVA');
    FOR prod IN prodCurs
    LOOP
        DBMS_OUTPUT.PUT_LINE(prod.REF ||
                             ' | ' || prod.LIBELLE ||
                             ' | ' || prod.ID_FAMILLE ||
                             ' | ' || prod.ID_CATEGORIE ||
                             ' | ' || prod.PU ||
                             ' | ' || prod.TVA);
    END LOOP;
END;