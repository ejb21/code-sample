DECLARE

    item_price      NUMBER( 8 , 2 ) ;
    money           NUMBER( 8 , 2 ) ;
    counter         INT := 0 ;


BEGIN

    money := '&money' ;
    item_price := '&item_price' ;
    
    WHILE money >= item_price LOOP
        money := money - item_price ;
        counter := counter + 1 ;
    END LOOP ;
    
    DBMS_OUTPUT.PUT_LINE( 'You can purchase ' || counter || ' items.' ) ;


END ;