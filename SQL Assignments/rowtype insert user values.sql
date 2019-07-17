DECLARE

    rec_shopper     BB_SHOPPER%ROWTYPE ;


BEGIN

    rec_shopper.idShopper   := bb_shopper_seq.NEXTVAL ;
    rec_shopper.firstName   := '&firstName' ;
    rec_shopper.lastName    := '&lastName' ;
    rec_shopper.address     := '&address' ;
    rec_shopper.city        := '&city' ;
    rec_shopper.state       := '&state' ;
    rec_shopper.zipCode     := '&zipCode' ;
    
    INSERT INTO bb_shopper VALUES rec_shopper ;


END ;