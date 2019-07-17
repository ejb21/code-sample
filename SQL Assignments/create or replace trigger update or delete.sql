CREATE OR REPLACE TRIGGER trig_productInventory
AFTER DELETE OR UPDATE ON BB_BASKET
    FOR EACH ROW


DECLARE

    CURSOR cur_basketItem IS
        SELECT  IDPRODUCT , QUANTITY
        FROM    BB_BASKETITEM
        WHERE   IDBASKET = :NEW.IDBASKET ;


BEGIN

    IF UPDATING( 'ORDERPLACED' ) THEN
        FOR rec_basketItem IN cur_basketItem LOOP
            UPDATE  BB_PRODUCT
            SET     STOCK = ( stock - rec_basketItem.QUANTITY )
            WHERE   IDPRODUCT = rec_basketItem.IDPRODUCT ;
        END LOOP ;
    END IF ;
    
    IF DELETING THEN
        FOR rec_basketItem IN cur_basketItem LOOP
            UPDATE  BB_PRODUCT
            SET     STOCK = ( stock + rec_basketItem.QUANTITY )
            WHERE   IDPRODUCT = rec_basketItem.IDPRODUCT ;
        END LOOP ;
    END IF ;


END ;