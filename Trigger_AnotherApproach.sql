-- QUESTION 1
CREATE OR REPLACE TRIGGER insertMod
    BEFORE INSERT OR UPDATE
    ON COMMANDE
    FOR EACH ROW
BEGIN
    IF :new.DATE_COMMANDE > :new.DATE_LIVRAISON THEN
      RAISE_APPLICATION_ERROR( -2341,
                              'Date livraison inferieur que date commande');
    ELSE
        startCleanUP(); -- this makes trigQ3 redundant since the schedular will take care of it 
    END IF;
END;
-- QUESTION 2
CREATE OR REPLACE TRIGGER insertMod
    AFTER INSERT
    ON COMMANDE
    FOR EACH ROW
BEGIN
    INSERT
    INTO HISTORIQUE (N_COMMANDE, ID_CLIENT, DATE_COMMANDE)
    VALUES (:NEW.n_commande,
            :NEW.id_client,
            :NEW.date_commande);
END;
-- QUESTION 3
-- gets taken care of by the schedular 
