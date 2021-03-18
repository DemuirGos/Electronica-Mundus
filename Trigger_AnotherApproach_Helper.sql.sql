CREATE PROCEDURE removeDilveredItems AS
    CURSOR deliveredComms IS
        select n_command, id_client, date_command 
        from Commande 
        where date_livraison <= SYSDATE;
BEGIN
    FOR command IN deliveredComms
    LOOP
        INSERT INTO HISTORIQUE (N_COMMANDE, ID_CLIENT, DATE_COMMANDE) VALUES 
                (
                    command.n_commande,
                    command.id_client,
                    command.date_commande
                );
    END LOOP;
END;

CREATE PROCEDURE startCleanUP AS
    found INT
BEGIN
    select COUNT(*)
    into found
    from dba_scheduler_running_jobs
    where job_name = "bdsm_cleaneup";
    IF found = 0 THEN
        DBMS_SCHEDULER.CREATE_JOB(
            JOB_NAME   => 'bdsm_cleaneup',
            JOB_TYPE   => 'STORED_PROCEDURE',
            JOB_ACTION => 'removeDilveredItems',
            repeat_interval => 'freq=daily; byhour=0; byminute=0; bysecond=0;',
            START_DATE => SYSTIMESTAMP,
            ENABLED    => TRUE,
            COMMENT    => 'removal of delivered items'
        );
    END IF;
END;

CREATE PROCEDURE stopCleanUP AS
BEGIN
    sys.dbms_scheduler.STOP_JOB(job_name=>'bdsm_cleaneup', force=>true);
END;

