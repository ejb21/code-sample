CREATE OR REPLACE FUNCTION TAX_CALC_SF
(
    f_basketID      BB_BASKET.IDBASKET%TYPE
)
RETURN NUMBER

AS

    lv_subtotal     BB_BASKET.SUBTOTAL%TYPE ;
    lv_taxRate      BB_TAX.TAXRATE%TYPE ;
    lv_shipState    BB_BASKET.SHIPSTATE%TYPE ;


BEGIN

    SELECT      SUBTOTAL , SHIPSTATE
    INTO        lv_subtotal , lv_shipState
    FROM        BB_BASKET
    WHERE       IDBASKET = f_basketID ;
    
    IF lv_shipState = 'VA' THEN
        lv_taxRate := 0.045 ;
    ELSIF lv_shipState = 'NC' THEN
        lv_taxRate := 0.03 ;
    ELSIF lv_shipState = 'SC' THEN
        lv_taxRate := 0.06 ;
    ELSE lv_taxRate := 0 ;
    END IF ;
    
    RETURN ( lv_subtotal * lv_taxRate ) ;


END ;