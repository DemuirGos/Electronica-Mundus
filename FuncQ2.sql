CREATE OR REPLACE FUNCTION MinAndMaxClient
RETURN TUPLE2
AS
    CURSOR clientCurs IS
        SELECT DISTINCT ID_CLIENT FROM COMMANDE;
    maxC INT := 0;
    minC INT := 2147483647;
    x INT;
BEGIN
    FOR client IN clientCurs
    LOOP
        x := SOMMECOMMANDESDE(client.ID_CLIENT);

        IF x > maxC THEN
           maxC := client.ID_CLIENT;
        end if;

        IF x < minC THEN
            minC := client.ID_CLIENT;
        end if;
    end loop;

    return TUPLE2(minC, maxC );
END;
