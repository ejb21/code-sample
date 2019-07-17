DECLARE

    rec_shopper     BB_SHOPPER%ROWTYPE ;


BEGIN

    SELECT * INTO rec_shopper FROM BB_SHOPPER WHERE IDSHOPPER = 27 ;
    
    DBMS_OUTPUT.PUT_LINE( rec_shopper.lastName || ', ' || rec_shopper.firstName ) ;
    DBMS_OUTPUT.PUT_LINE( rec_shopper.address ) ;
    DBMS_OUTPUT.PUT_LINE( rec_shopper.city || ', ' || rec_shopper.state || ' ' || rec_shopper.zipcode ) ;


END ;