DECLARE

    rec_shopper     BB_SHOPPER%ROWTYPE ;
    lv_shopperID    BB_SHOPPER.IDSHOPPER%TYPE ;


BEGIN

    lv_shopperID := &lv_shopperID ;
    
    SELECT      *
    INTO        rec_shopper
    FROM        BB_SHOPPER
    WHERE       IDSHOPPER = lv_shopperID ;
    
    -- DBMS_OUTPUT.PUT_LINE( rec_shopper.FIRSTNAME || ' ' || rec_shopper.LASTNAME ) ;


EXCEPTION

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE( 'Shopper ID not found.' ) ;


END ;