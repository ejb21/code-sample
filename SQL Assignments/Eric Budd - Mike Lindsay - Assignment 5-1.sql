--   Eric Budd  &&  Mike Lindsay


CREATE OR REPLACE PROCEDURE prod_name_sp(
    p_prodid            IN bb_product.idproduct%TYPE,
    p_productname       IN bb_product.productname%TYPE )
    
IS

BEGIN

    UPDATE      bb_product
    SET         productname = p_productname
    WHERE       idproduct = p_prodid ;
    
    COMMIT ;

END ;