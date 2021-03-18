CREATE OR REPLACE TRIGGER deliveredTrig
    AFTER UPDATE OF ETAT
    ON COMMANDE
    FOR EACH ROW
BEGIN
    IF :New.Regle = 1 THEN
        INSERT
        INTO HISTORIQUE (N_COMMANDE, ID_CLIENT, DATE_COMMANDE)
        VALUES (:new.n_commande,
                :new.id_client,
                :new.date_commande);
    end if;
END;