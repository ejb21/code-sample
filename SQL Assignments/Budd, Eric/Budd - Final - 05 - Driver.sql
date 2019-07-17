DECLARE

    lv_basketID     BB_BASKET.IDBASKET%TYPE ;
    lv_status       VARCHAR( 50 ) ;


BEGIN

    lv_basketID := &lv_basketID ;
    
    proc_orderStatus( p_basketID => lv_basketID , p_status => lv_status ) ;
    
    DBMS_OUTPUT.PUT_LINE( 'Basket #' || lv_basketID || '''s status: ' || lv_status ) ;


END ;