DECLARE

    lv_basketID     NUMBER( 3 )     := 12 ;
    lv_count        NUMBER( 3 ) ;
    lv_subtotal     NUMBER( 8 , 2 ) ;
    lv_shipCost     NUMBER( 8 , 2 ) ;
    lv_total        NUMBER( 8 , 2 ) ;


BEGIN

    bbOrder.orderTotal( lv_basketID , lv_count , lv_subtotal , lv_shipCost , lv_total ) ;
    
    DBMS_OUTPUT.PUT_LINE( 'Basket ID: ' || lv_basketID ) ;
    DBMS_OUTPUT.PUT_LINE( 'Count: ' || lv_count ) ;
    DBMS_OUTPUT.PUT_LINE( 'Subtotal: ' || lv_subtotal ) ;
    DBMS_OUTPUT.PUT_LINE( 'Shipping cost: ' || lv_shipCost ) ;
    DBMS_OUTPUT.PUT_LINE( 'Total: ' || lv_total ) ;


END ;