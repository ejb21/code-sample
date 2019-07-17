DECLARE

    lv_total    BB_BASKET.TOTAL%TYPE ;


BEGIN

    SELECT  TOTAL
    INTO    lv_total
    FROM    BB_BASKET
    WHERE   IDBASKET = 120 ;

    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE( 'Didn''t work, dummy.' ) ;
    END IF ;


EXCEPTION

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE( 'Didn''t work, dummy.' ) ;


END ;