CREATE OR REPLACE FUNCTION toCurrency(montant IN Number,ratio IN Number)
RETURN Number
AS
    result NUMBER;
BEGIN
    result := montant / ratio;
    return result;
END;

CREATE OR REPLACE FUNCTION toUSD(
    montant IN Number,
    ratio IN Number DEFAULT 9.00
)
RETURN Number
    AS
    result NUMBER;
BEGIN
    result := toCurrency(montant,ratio);
    return result;
END;

CREATE OR REPLACE FUNCTION toEUR(
    montant IN Number,
    ratio IN Number DEFAULT 10.71
)
RETURN Number
AS
    result NUMBER;
BEGIN
    result := toCurrency(montant,ratio);
    return result;
    END;

CREATE OR REPLACE FUNCTION toUSDorEUR(price IN Number,currency IN Varchar2)
RETURN Number
AS
    result NUMBER;
BEGIN 
    IF currency = 'USD' THEN
        result :=  toUSD(price);
    ELSIF currency = 'EUR' THEN
        result :=  toEUR(price);
    END IF;
    return result;
END;