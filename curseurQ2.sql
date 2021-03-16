DECLARE
    prodId CATALOGUE.Ref%type;
    dateBegin date;
    dateEnd date;

    CURSOR sellCurs IS
        SELECT PC.QUANTITE
        FROM
            CATALOGUE CA
                JOIN PRODUITCOMMANDES PC
                    ON CA.REF = PC.REF_CATALOGUE
                JOIN COMMANDE CO
                    ON CO.N_COMMANDE = PC.N_COMMANDE
        WHERE
            CA.REF = prodId
            AND CO.DATE_COMMANDE >= dateBegin
            AND CO.DATE_COMMANDE <= dateEnd;

    total INTEGER := 0;
    counter INTEGER := 0;
    prodName VARCHAR(100);
BEGIN
    prodId :=: prodId;
    dateBegin :=: dateBegin;
    dateEnd :=: dateEnd;

    SELECT LIBELLE INTO prodName FROM CATALOGUE WHERE REF = prodId;

    FOR sell in sellCurs
    LOOP
        counter := counter + 1;
        total := total + sell.QUANTITE;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(prodName || ' (REF = ' || prodId || ') a ete vendu ' || total || ' fois' ||
                        ' entre la ' || dateBegin || ' et ' || dateEnd || ' d une quantite de '
                         || counter || ' pieces vendues.' );
END;