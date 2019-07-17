DECLARE

    lv_custID   BB_SHOPPER.IDSHOPPER%TYPE ;
    lv_total    BB_BASKET.TOTAL%TYPE ;


BEGIN

    lv_custID := &lv_custID ;
    
    SELECT      SUM( TOTAL )
    INTO        lv_total
    FROM        BB_BASKET
    WHERE       IDSHOPPER = lv_custID ;
    
    CASE
        WHEN lv_total >= 200 THEN
            DBMS_OUTPUT.PUT_LINE( 'Customer #' || lv_custID || ' is in the HIGH tier.' ) ;
        WHEN lv_total >= 100 THEN
            DBMS_OUTPUT.PUT_LINE( 'Customer #' || lv_custID || ' is in the MED tier.' ) ;
        ELSE
            DBMS_OUTPUT.PUT_LINE( 'Customer #' || lv_custID || ' is in the LOW tier.' ) ;
    END CASE ;


END ;