CREATE OR REPLACE PROCEDURE proc_asdf
(
    p_username      IN VARCHAR2 ,
    p_password      IN VARCHAR2 ,
    p_displayName   OUT VARCHAR2
)

AS

    lv_memberID         BB_SHOPPER.IDSHOPPER%TYPE ;

BEGIN

    SELECT      IDSHOPPER
    INTO        lv_memberID
    FROM        BB_SHOPPER
    WHERE       USERNAME = p_username  AND  PASSWORD = p_password ;
    
    p_displayName := func_displayName( lv_memberID ) ;


EXCEPTION

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE( 'No user data found with those credentials.' ) ;


END ;