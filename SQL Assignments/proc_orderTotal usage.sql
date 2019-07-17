DECLARE

    lv_basketID     BB_BASKETITEM.IDBASKET%TYPE ;
    lv_quantity     NUMBER( 3 ) ;
    lv_subtotal     NUMBER( 8 , 2 ) ;
    lv_shipCost     NUMBER( 8 , 2 ) ;
    lv_total        NUMBER( 8 , 2 ) ;


BEGIN

    lv_basketID := &lv_basketID ;
    
    proc_orderTotal( lv_basketID , lv_quantity , lv_subtotal , lv_shipCost , lv_total ) ;
    
    DBMS_OUTPUT.PUT_LINE( 'Basket: ' || lv_basketID ) ;
    DBMS_OUTPUT.PUT_LINE( 'Quantity: ' || lv_quantity ) ;
    DBMS_OUTPUT.PUT_LINE( 'Subtotal: ' || lv_subtotal ) ;
    DBMS_OUTPUT.PUT_LINE( 'Shipping: ' || lv_shipCost ) ;
    DBMS_OUTPUT.PUT_LINE( 'Total: ' || lv_total ) ;


END ;