DECLARE

    lv_shipCost     NUMBER( 6 , 2 ) ;


BEGIN

    lv_shipCost := func_shipCalc( 12 ) ;
    
    DBMS_OUTPUT.PUT_LINE( lv_shipCost ) ;


END ;