CREATE OR REPLACE TRIGGER trig_productInventory
AFTER UPDATE OF ORDERPLACED ON BB_BASKET
    FOR EACH ROW
    WHEN ( OLD.ORDERPLACED <> 1 AND NEW.ORDERPLACED = 1 )
    

DECLARE

    CURSOR cur_basketItem IS
        SELECT  IDPRODUCT , QUANTITY , OPTION1
        FROM    BB_BASKETITEM
        WHERE   IDBASKET = :NEW.IDBASKET ;
    
    lv_change   NUMBER( 3 , 1 ) ;


BEGIN

    FOR rec_basketItem IN cur_basketItem LOOP
        IF rec_basketItem.OPTION1 = 1 THEN
            lv_change := ( 0.5 * rec_basketItem.QUANTITY ) ;
        ELSE
            lv_change := rec_basketItem.QUANTITY ;
        END IF ;
        
        UPDATE  BB_PRODUCT
        SET     STOCK = ( stock - lv_change )
        WHERE   IDPRODUCT = rec_basketItem.IDPRODUCT ;
    END LOOP ;


END ;