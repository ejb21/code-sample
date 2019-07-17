DECLARE

    lv_basketID         BB_BASKET.IDBASKET%TYPE ;
    lv_createdDate      BB_BASKET.DTCREATED%TYPE ;
    lv_numDays          NUMBER( 4 ) ;


BEGIN

    SELECT  IDBASKET , DTCREATED
    INTO    lv_basketID , lv_createdDate
    FROM    BB_BASKET
    WHERE   IDSHOPPER = 25 AND ORDERPLACED = 0 ;
    
    lv_numDays := CURRENT_DATE - lv_createdDate ;
    
    DBMS_OUTPUT.PUT_LINE( 'Basket ID: ' || lv_basketID ) ;
    DBMS_OUTPUT.PUT_LINE( 'Number of days: ' || lv_numDays ) ;


END;