CREATE OR REPLACE PROCEDURE proc_shipCost
(
    p_quantity      IN NUMBER ,
    p_shipCost      OUT NUMBER
)

AS

BEGIN

    IF p_quantity > 10 THEN
        p_shipCost := 11.00 ;
    ELSIF p_quantity > 5 THEN
        p_shipCost := 8.00 ;
    ELSE
        p_shipCost := 5.00 ;
    END IF ;

END ;