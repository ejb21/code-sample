CREATE OR REPLACE FUNCTION func_displayName
(
    f_memberID      IN NUMBER
)
RETURN VARCHAR2

AS

    lv_firstName    MM_MEMBER.FIRST%TYPE ;
    lv_lastName     MM_MEMBER.LAST%TYPE ;
    lv_displayName  VARCHAR2( 50 ) ;

BEGIN

    SELECT      FIRST , LAST
    INTO        lv_firstName , lv_lastName
    FROM        MM_MEMBER
    WHERE       MEMBER_ID = f_memberID ;

    lv_displayName := 'Member ' || f_memberID || ': ' || lv_firstName || ' ' || lv_lastName ;
    
    RETURN lv_displayName ;


END ;