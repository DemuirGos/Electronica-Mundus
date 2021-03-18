CREATE OR REPLACE TRIGGER afterInsertHandler
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
