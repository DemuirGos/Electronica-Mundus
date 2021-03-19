CREATE OR REPLACE FUNCTION MinAndMaxClient
RETURN TUPLE2
AS
    CURSOR clientCurs IS
        SELECT DISTINCT ID_CLIENT FROM COMMANDE;
    maxV INT := 0;
    minV INT := 2147483647;
    maxC INT := 0;
    minC INT := 0;
    x INT;
BEGIN
    FOR client IN clientCurs
    LOOP
        x := SOMMECOMMANDESDE(client.ID_CLIENT);

        IF x > maxV THEN
           maxC := client.ID_CLIENT;
           maxV := x;
        end if;

        IF x <= minV THEN
            minC := client.ID_CLIENT;
            minV := x;
        end if;
    end loop;

    return TUPLE2(minC, maxC );
END;
