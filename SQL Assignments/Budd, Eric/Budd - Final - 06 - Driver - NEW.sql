DECLARE

    lv_basketID         BB_BASKET.IDBASKET%TYPE ;
    lv_dateOrdered      BB_BASKET.DTORDERED%TYPE ;
    lv_dayOrdered       VARCHAR2( 10 ) ;


BEGIN

    lv_basketID := &lv_basketID ;
    
    lv_dateOrdered := func_dayOfWeek( lv_basketID ) ;
    lv_dayOrdered := TO_CHAR( lv_dateOrdered , 'DY' ) ;
    
    IF lv_dateOrdered IS NULL THEN
        DBMS_OUTPUT.PUT_LINE( 'Order has not been placed.' ) ;
    ELSE
        DBMS_OUTPUT.PUT_LINE( 'Order was placed on ' || lv_dayOrdered ) ;
    END IF ;


END ;