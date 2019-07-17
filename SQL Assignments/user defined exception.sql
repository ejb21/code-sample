DECLARE

    ex_product_update   EXCEPTION ;


BEGIN

    UPDATE      BB_PRODUCT
    SET         PRODUCTNAME = 'New Brazil'
    WHERE       IDPRODUCT = 18 ;
    
    IF SQL%NOTFOUND THEN
        RAISE ex_product_update ;
    END IF ;


EXCEPTION

    WHEN ex_product_update THEN
        DBMS_OUTPUT.PUT_LINE( 'Table not updated. Dummy.' ) ;


END ;