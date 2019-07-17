CREATE OR REPLACE FUNCTION func_displayName
(
    f_memberID      IN NUMBER ,
    f_firstName     IN VARCHAR2 , 
    f_lastName      IN VARCHAR2
)
RETURN VARCHAR2

AS

    lv_displayName  VARCHAR2( 50 ) ;

BEGIN

    lv_displayName := 'Member ' || f_memberID || ': ' || f_firstName || ' ' || f_lastName ;
    
    RETURN lv_displayName ;


END ;