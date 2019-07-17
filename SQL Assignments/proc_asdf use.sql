DECLARE

    lv_username         BB_SHOPPER.USERNAME%TYPE ;
    lv_password         BB_SHOPPER.PASSWORD%TYPE ;
    lv_displayName      VARCHAR2( 50 ) ;


BEGIN
    
    lv_username := '&lv_username' ;
    lv_password := '&lv_password' ;
    
    proc_asdf( p_username => lv_username , p_password => lv_password , p_displayName => lv_displayName ) ;
    
    DBMS_OUTPUT.PUT_LINE( lv_displayName ) ;


END ;