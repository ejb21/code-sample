CREATE OR REPLACE FUNCTION func_displayName
(
    f_shopperID      IN NUMBER
)
RETURN VARCHAR2

AS

    lv_firstName    BB_SHOPPER.FIRSTNAME%TYPE ;
    lv_lastName     BB_SHOPPER.LASTNAME%TYPE ;
    lv_displayName  VARCHAR2( 50 ) ;

BEGIN

    SELECT      FIRSTNAME , LASTNAME
    INTO        lv_firstName , lv_lastName
    FROM        BB_SHOPPER
    WHERE       IDSHOPPER = f_shopperID ;

    lv_displayName := 'Member ' || f_shopperID || ': ' || lv_firstName || ' ' || lv_lastName ;
    
    RETURN lv_displayName ;


END ;