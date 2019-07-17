DECLARE

    lv_quantity     BB_BASKETITEM.QUANTITY%TYPE ;


BEGIN

    SELECT      SUM( QUANTITY )
    INTO        lv_quantity
    FROM        bb_basketItem
    WHERE       idBasket = 5 ;
    
    DBMS_OUTPUT.PUT_LINE( lv_quantity ) ;


END;