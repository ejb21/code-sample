/*
    LOOPING STRUCTURES
    ———————————
    BASIC LOOP
    WHILE LOOP
    FOR LOOP
    CONTINUE STATEMENT
*/

DECLARE

    counter     NUMBER( 5 )     := 1 ;


BEGIN

    --  BASIC LOOP
    LOOP
        DBMS_OUTPUT.PUT_LINE( 'Basic loop: ' || counter ) ;
        EXIT WHEN counter >= 5 ;
        counter := counter + 1 ;
    END LOOP ;
    
    DBMS_OUTPUT.PUT_LINE( '' ) ;
        
        
    --  WHILE LOOP
    WHILE counter < 50 LOOP
        DBMS_OUTPUT.PUT_LINE( 'While loop: ' || counter ) ;
        counter := counter + 1 ;
    END LOOP ;
    
    DBMS_OUTPUT.PUT_LINE( '' ) ;
    
    
    --  FOR LOOP
    FOR i IN 200..220 LOOP
        DBMS_OUTPUT.PUT_LINE( 'For loop: ' || i ) ;
    END LOOP ;
    
    DBMS_OUTPUT.PUT_LINE( '' ) ;
    
    
    --  FOR LOOP IN REVERSE
    FOR i IN REVERSE 0..10 LOOP
        DBMS_OUTPUT.PUT_LINE( 'Reverse for loop: ' || i ) ;
    END LOOP ;
    
    DBMS_OUTPUT.PUT_LINE( '' ) ;
    
    
    --  FOR LOOP WITH CONTINUE
    FOR i IN REVERSE 0..100 LOOP
        CONTINUE WHEN MOD( i , 10 ) <> 0 ;
        DBMS_OUTPUT.PUT_LINE( 'Reverse for loop with continue: ' || i ) ;
    END LOOP ;


END ;