DECLARE

    rec_shopper     BB_SHOPPER%ROWTYPE ;


BEGIN

    SELECT  *
    INTO    rec_shopper
    FROM    BB_SHOPPER
    WHERE   IDSHOPPER = 27 ;
    
    DBMS_OUTPUT.PUT_LINE( rec_shopper.firstName ) ;
    DBMS_OUTPUT.PUT_LINE( rec_shopper.email ) ;
    DBMS_OUTPUT.PUT_LINE( rec_shopper.city ) ;
    DBMS_OUTPUT.PUT_LINE( rec_shopper.phone ) ;


END;