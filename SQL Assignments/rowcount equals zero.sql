DECLARE

    lv_total    BB_BASKET.TOTAL%TYPE ;


BEGIN

    UPDATE  BB_PRODUCT
    SET     STOCK = STOCK + 25
    WHERE   IDPRODUCT = 15 ;
    
    DBMS_OUTPUT.PUT_LINE( 'Affected rows: ' || SQL%ROWCOUNT ) ;


END ;