DECLARE

    lv_test_date    DATE                    := '10-DEC-2012' ;
    lv_test_num     CONSTANT NUMBER( 3 )    := 10 ;
    lv_test_txt     VARCHAR2( 10 ) ;


BEGIN

    lv_test_txt := 'Eric' ;
    DBMS_OUTPUT.PUT_LINE( lv_test_date ) ;
    DBMS_OUTPUT.PUT_LINE( lv_test_num ) ;
    DBMS_OUTPUT.PUT_LINE( lv_test_txt ) ;


END ;