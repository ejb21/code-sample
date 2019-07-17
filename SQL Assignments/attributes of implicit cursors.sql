DECLARE

    lv_total    BB_BASKET.TOTAL%TYPE ;
    nfVar       VARCHAR( 10 ) ;
    fVar        VARCHAR( 10 ) ;


BEGIN

    SELECT  TOTAL
    INTO    lv_total
    FROM    BB_BASKET
    WHERE   idBasket = 12 ;
    
    nfVar := CASE WHEN SQL%NOTFOUND THEN 'True' ELSE 'False' END ;
    fVar := CASE WHEN SQL%FOUND THEN 'True' ELSE 'False' END ;
    
    -- ATTRIBUTES OF IMPLICIT CURSORS
    DBMS_OUTPUT.PUT_LINE( 'Number of rows affected: ' || SQL%ROWCOUNT ) ;
    DBMS_OUTPUT.PUT_LINE( 'NOTFOUND value: ' || nfVar ) ;
    DBMS_OUTPUT.PUT_LINE( 'FOUND value: ' || fVar ) ;


END ;