CREATE OR REPLACE PACKAGE BODY LOGIN_PKG AS

    FUNCTION LOGIN
    (
        f_username      IN      BB_SHOPPER.USERNAME%TYPE ,
        f_password      IN      BB_SHOPPER.PASSWORD%TYPE
    )
    RETURN VARCHAR2 AS

        lv_match    VARCHAR2( 1 )   := 'N' ;
        lv_ID       BB_SHOPPER.IDSHOPPER%TYPE ;

BEGIN


    SELECT      IDSHOPPER
    INTO        lv_ID
    FROM        BB_SHOPPER
    WHERE       USERNAME = f_username
    AND         PASSWORD = f_password ;
    
    lv_match := 'Y' ;
    RETURN lv_match ;


EXCEPTION

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE( 'Login values are invalid.' ) ;
    END ;


END ;