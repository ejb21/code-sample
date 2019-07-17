DECLARE

    lv_quantity     NUMBER( 3 ) ;
    lv_shipCost     NUMBER( 6 , 2 ) ;


BEGIN

    lv_quantity := &lv_quantity ;
    
    -- proc_shipCost( lv_quantity , lv_shipCost ) ;
    
    proc_shipCost( p_shipCost => lv_shipCost , p_quantity => lv_quantity ) ;
    
    DBMS_OUTPUT.PUT_LINE( 'Shipping cost: ' || lv_shipCost ) ;


END ;