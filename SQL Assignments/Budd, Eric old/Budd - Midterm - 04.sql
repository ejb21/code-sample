DECLARE

    lv_num      NUMBER( 4 , 0 ) := 2021 ;


BEGIN

    WHILE lv_num >= 1980 LOOP
        lv_num := lv_num - 1 ;
        CONTINUE WHEN MOD( lv_num , 5 ) <> 0 ;
        DBMS_OUTPUT.PUT_LINE( lv_num ) ;
    END LOOP ;


END ;