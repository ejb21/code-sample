DECLARE

    CURSOR cur_product IS
        SELECT  TYPE , PRICE
        FROM    BB_PRODUCT
        WHERE   ACTIVE = 1
        FOR UPDATE NOWAIT ;         -- "FOR UPDATE": don't have to specify WHERE in cursor UPDATE
    
    lv_sale     BB_PRODUCT.SALEPRICE%TYPE ;


BEGIN

    FOR rec_product IN cur_product LOOP
        IF rec_product.TYPE = 'C' THEN
            lv_sale := rec_product.PRICE * .9 ;
        ELSIF rec_product.TYPE = 'E' THEN
            lv_sale := rec_product.PRICE * .95 ;
        END IF ;
        
        UPDATE  BB_PRODUCT
        SET     SALEPRICE = lv_sale
        WHERE CURRENT OF cur_product ;
    END LOOP ;
    
   -- COMMIT ;


END ;