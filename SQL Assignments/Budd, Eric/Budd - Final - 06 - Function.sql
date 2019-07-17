CREATE OR REPLACE FUNCTION func_dayOfWeek
(
    f_basketID      BB_BASKET.IDBASKET%TYPE
)
RETURN DATE

AS

    lv_dateOrdered   BB_BASKET.DTORDERED%TYPE ;

BEGIN

    SELECT      DTORDERED
    INTO        lv_dateOrdered
    FROM        BB_BASKET
    WHERE       IDBASKET = f_basketID ;
    
    RETURN lv_dateOrdered ;


EXCEPTION

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE( 'Basket not found.' ) ;


END ;