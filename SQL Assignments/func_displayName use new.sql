DECLARE

    lv_displayName      VARCHAR2( 50 ) ;
    lv_memberID         NUMBER( 2 )         := 10 ;


BEGIN
    
    lv_displayName := func_displayName( lv_memberID ) ;
    
    DBMS_OUTPUT.PUT_LINE( lv_displayName ) ;


END ;