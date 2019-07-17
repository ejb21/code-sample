DECLARE

    TYPE numberArray IS TABLE OF NUMBER INDEX BY BINARY_INTEGER ;
    
    ageArray        numberArray ;
    lv_total        NUMBER( 3 , 0 )     := 0 ;
    lv_average      NUMBER( 6 , 2 )     := 0 ;


BEGIN

    ageArray( 1 ) := '&Person1' ;
    ageArray( 2 ) := '&Person2' ;
    ageArray( 3 ) := '&Person3' ;
    ageArray( 4 ) := '&Person4' ;
    ageArray( 5 ) := '&Person5' ;
    
    FOR i IN 1..ageArray.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE( ageArray( i ) ) ;
        lv_total := lv_total + ageArray( i ) ;
    END LOOP ;
    
    lv_average := lv_total / ageArray.COUNT ;
    
    DBMS_OUTPUT.PUT_LINE( '' ) ;
    DBMS_OUTPUT.PUT_LINE( 'Total: ' || lv_total ) ;
    DBMS_OUTPUT.PUT_LINE( 'Average: ' || lv_average ) ;


END ;