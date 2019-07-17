DECLARE

    lv_balance     NUMBER( 8 , 2 ) ;
    lv_payment     NUMBER( 8 , 2 ) ;
    lv_due         BOOLEAN ;


BEGIN

    lv_balance := '&lv_balance' ;
    lv_payment := '&lv_payment' ;
    
    IF ( lv_balance - lv_payment ) > 0 THEN
        lv_due := TRUE ;
        DBMS_OUTPUT.PUT_LINE( 'Balance due...' ) ;
    ELSE
        lv_due := FALSE ;
        DBMS_OUTPUT.PUT_LINE( 'No balance due.' ) ;
    END IF ;


END ;