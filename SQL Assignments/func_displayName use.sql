DECLARE

    lv_displayName      VARCHAR2( 50 ) ;
    lv_memberID         NUMBER( 2 )         := 4 ;
    lv_firstName        VARCHAR2( 20 )      := 'Eric' ;
    lv_lastName         VARCHAR2( 20 )      := 'Budd' ;


BEGIN

    lv_displayName := func_displayName( lv_memberID , lv_firstName , lv_lastName ) ;
    
    DBMS_OUTPUT.PUT_LINE( lv_displayName ) ;


END ;