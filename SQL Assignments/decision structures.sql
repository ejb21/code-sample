DECLARE

    lv_total_num NUMBER( 6 , 2 ) := 350 ;


BEGIN

/*
    IF lv_total_num > 200 THEN
        DBMS_OUTPUT.PUT_LINE( 'HIGH' ) ;
        
    ELSIF lv_total_num > 100 THEN
        DBMS_OUTPUT.PUT_LINE( 'MID' ) ;
        
    ELSE
        DBMS_OUTPUT.PUT_LINE( 'LOW' ) ;
        
    END IF ;
*/

    CASE
        WHEN lv_total_num > 200 THEN
            DBMS_OUTPUT.PUT_LINE( 'HIGH' ) ;
        WHEN lv_total_num > 100 THEN
            DBMS_OUTPUT.PUT_LINE( 'MID' ) ;
        ELSE
            DBMS_OUTPUT.PUT_LINE( 'LOW' ) ;
    END CASE ;


END ;