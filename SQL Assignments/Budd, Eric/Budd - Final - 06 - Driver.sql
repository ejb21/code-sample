DECLARE

    lv_basketID         BB_BASKET.IDBASKET%TYPE ;
    lv_dateOrdered      BB_BASKET.DTORDERED%TYPE ;


BEGIN

    lv_basketID := &lv_basketID ;
    
    lv_dateOrdered := func_dayOfWeek( lv_basketID ) ;
    
    IF lv_dateOrdered IS NULL THEN
        DBMS_OUTPUT.PUT_LINE( 'Order has not been placed.' ) ;
    ELSE
        DBMS_OUTPUT.PUT_LINE( 'Order was placed on ' || lv_dateOrdered ) ;
    END IF ;


END ;