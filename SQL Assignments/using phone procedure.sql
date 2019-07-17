DECLARE

    lv_phone    VARCHAR2( 13 ) ;


BEGIN

    lv_phone := &lv_phone ;
    
    DBMS_OUTPUT.PUT_LINE( lv_phone ) ;
    
    proc_phoneFormat( lv_phone ) ;
    
    DBMS_OUTPUT.PUT_LINE( lv_phone ) ;


END ;