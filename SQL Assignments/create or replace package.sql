CREATE OR REPLACE PACKAGE bbOrder IS
    
    PROCEDURE orderTotal
    (
        p_basketID      IN      BB_BASKETITEM.IDBASKET%TYPE ,
        p_count         OUT     NUMBER ,
        p_subtotal      OUT     NUMBER ,
        p_shipCost      OUT     NUMBER ,
        p_total         OUT     NUMBER
    ) ;
    
    FUNCTION shipCalc
    (
        p_quantity      IN      NUMBER
    )
    RETURN NUMBER ;

END ;