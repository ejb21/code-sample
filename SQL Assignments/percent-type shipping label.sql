DECLARE

    lv_firstName        BB_SHOPPER.FIRSTNAME%TYPE ;
    lv_lastName         BB_SHOPPER.LASTNAME%TYPE ;
    lv_address          BB_SHOPPER.ADDRESS%TYPE ;
    lv_city             BB_SHOPPER.CITY%TYPE ;
    lv_state            BB_SHOPPER.STATE%TYPE ;
    lv_zip              BB_SHOPPER.ZIPCODE%TYPE ;


BEGIN

    SELECT firstName , lastName , address , city , state , zipCode
        INTO lv_firstName , lv_lastName , lv_address , lv_city , lv_state , lv_zip
        FROM BB_SHOPPER
            WHERE idShopper = 27 ;
    
    DBMS_OUTPUT.PUT_LINE( lv_lastName || ', ' || lv_firstName ) ;
    DBMS_OUTPUT.PUT_LINE( lv_address ) ;
    DBMS_OUTPUT.PUT_LINE( lv_city || ', ' || lv_state || ' ' || lv_zip ) ;


END ;