CREATE OR REPLACE TRIGGER onModifiedHandler
    BEFORE INSERT OR UPDATE
    ON COMMANDE
    FOR EACH ROW
BEGIN
    IF :new.DATE_COMMANDE > :new.DATE_LIVRAISON THEN
      RAISE_APPLICATION_ERROR( -2341,
                              'Date livraison inferieur que date commande');
    END IF;
END;
