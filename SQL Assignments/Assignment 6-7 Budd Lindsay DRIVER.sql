DECLARE

    lv_basketID     BB_BASKET.IDBASKET%TYPE ;
    lv_subtotal     BB_BASKET.SUBTOTAL%TYPE ;
    lv_tax          BB_BASKET.TAX%TYPE ;


BEGIN

    lv_basketID := '&lv_basketID' ;
    
    --  The following update statement is to apply shipping tax to one of the baskets...
    --  As it stands, the BB_BASKETS all have a NULL value for SHIPSTATE.
    
    UPDATE      BB_BASKET
    SET         SHIPSTATE = 'VA'
    WHERE       IDBASKET = 3 ;
    
    SELECT      SUBTOTAL , TAX_CALC_SF( f_basketID => lv_basketID )
    INTO        lv_subtotal , lv_tax
    FROM        BB_BASKET
    WHERE       IDBASKET = lv_basketID ;
    
    DBMS_OUTPUT.PUT_LINE( 'Subtotal: ' || lv_subtotal ) ;
    DBMS_OUTPUT.PUT_LINE( 'Tax: ' || lv_tax ) ;
    DBMS_OUTPUT.PUT_LINE( 'Total: ' || (lv_subtotal + lv_tax) ) ;


END ;