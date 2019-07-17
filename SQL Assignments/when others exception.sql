DECLARE

    rec_shopper     BB_SHOPPER%ROWTYPE ;
    lv_shopperID    BB_SHOPPER.IDSHOPPER%TYPE ;


BEGIN

    lv_shopperID := &lv_shopperID ;
    
    SELECT      *
    INTO        rec_shopper
    FROM        BB_SHOPPER
    WHERE       IDSHOPPER = lv_shopperID ;


EXCEPTION

    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE( 'Invalid shopper ID. Stupid.' ) ;
    
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE( 'An error has occurred.' ) ;


END ;