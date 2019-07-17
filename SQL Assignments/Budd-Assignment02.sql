DECLARE

    lv_name         VARCHAR2( 25 ) ;
    lv_birthYear    NUMBER( 4 , 0 ) ;
    lv_year         CONSTANT NUMBER( 4 , 0 )    := 2017 ;
    lv_age          NUMBER( 3 , 0 ) ;
    lv_num          NUMBER( 3 , 0 )             := 0 ;


BEGIN

    lv_name := '&lv_name' ;
    DBMS_OUTPUT.PUT_LINE( 'Name: ' || lv_name ) ;
    
    lv_birthYear := '&lv_birthYear' ;
    lv_age := lv_year - lv_birthYear ;
    DBMS_OUTPUT.PUT_LINE( 'Age: ' || lv_age ) ;
    
    IF lv_age >= 21 THEN
        DBMS_OUTPUT.PUT_LINE( lv_name || ' is ' || lv_age || '. Cheers!' ) ;
    ELSE
        DBMS_OUTPUT.PUT_LINE( lv_name || ' is ' || lv_age || '. Go to Disney World!' ) ;
    END IF ;
    
    DBMS_OUTPUT.PUT_LINE( '' ) ;
    DBMS_OUTPUT.PUT_LINE( 'COUNTDOWN:' ) ;
    
    FOR i IN REVERSE 1..lv_age LOOP
        CONTINUE WHEN i > 10 AND MOD( i , 5 ) <> 0 ;
        DBMS_OUTPUT.PUT_LINE( i ) ;
        lv_num := lv_num + i ;
    END LOOP ;
    
    DBMS_OUTPUT.PUT_LINE( '' ) ;
    DBMS_OUTPUT.PUT_LINE( lv_num ) ;


END ;