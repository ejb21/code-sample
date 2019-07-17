DECLARE

    lv_orderCount       NUMBER( 4 , 0 ) ;
    lv_totalSpent       BB_BASKET.SUBTOTAL%TYPE ;
    lv_shopperID        NUMBER( 4 , 0 ) ;


BEGIN

    lv_shopperID := '&lv_shopperID' ;
    
    SELECT      COUNT( IDBASKET ) , SUM( SUBTOTAL )
    INTO        lv_orderCount , lv_totalSpent
    FROM        BB_BASKET
    WHERE       IDSHOPPER = lv_shopperID AND ORDERPLACED = 1
    GROUP BY    IDSHOPPER ;
    
    IF lv_orderCount >= 2 AND lv_totalSpent >= 75 THEN
        DBMS_OUTPUT.PUT_LINE( 'You qualify for a 10% discount on your next order!' ) ;
    ELSIF lv_orderCount >= 2 AND lv_totalSpent >= 50 THEN
        DBMS_OUTPUT.PUT_LINE( 'You qualify for a 7% discount on your next order.' ) ;
    END IF ;


END ;