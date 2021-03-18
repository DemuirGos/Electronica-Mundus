CREATE SEQUENCE prodCom_id_seq;

CREATE OR REPLACE TRIGGER prodComTrig
    BEFORE INSERT ON ProduitCommandes
    FOR EACH ROW
BEGIN
    SELECT prodCom_id_seq.nextval
    INTO :new.id_produit
    FROM dual;
END;

CREATE SEQUENCE historique_id_seq;

CREATE OR REPLACE TRIGGER historiqeAutoTrig
    BEFORE INSERT ON HISTORIQUE
    FOR EACH ROW
BEGIN
    SELECT historique_id_seq.nextval
    INTO :new.id_historique
    FROM dual;
END;
