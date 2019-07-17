CREATE OR REPLACE PROCEDURE proc_orderTotal
(
    p_basketID      IN BB_BASKETITEM.IDBASKET%TYPE ,
    p_quantity      OUT NUMBER ,
    p_subtotal      OUT NUMBER ,
    p_shipCost      OUT NUMBER ,
    p_total         OUT NUMBER
)

AS

BEGIN

    SELECT      SUM( QUANTITY ) , SUM( QUANTITY * PRICE )
    INTO        p_quantity , p_subtotal
    FROM        BB_BASKETITEM
    WHERE       IDBASKET = p_basketID ;
    
    proc_shipCost( p_quantity , p_shipCost ) ;
    
    p_total := p_subtotal + p_shipCost ;

END ;