DECLARE

    -- DECLARE EXPLICIT CURSOR
    CURSOR cur_basket IS
        SELECT  bi.IDBASKET , p.TYPE , bi.PRICE , bi.QUANTITY
        FROM    BB_BASKETITEM bi JOIN BB_PRODUCT p
        USING   ( IDPRODUCT )
        WHERE   IDBASKET = 6 ;
    
    -- CREATE LOCAL VARIABLES
    lv_rate     NUMBER( 2 , 2 ) ;
    lv_tax      NUMBER( 4 , 2 )     := 0 ;


BEGIN

    FOR myBasket IN cur_basket LOOP
        -- DETERMINE TYPE AND CALCULATE TAX
        IF myBasket.type = 'E'
            THEN lv_rate := .05 ;
        ELSIF myBasket.type = 'C'
            THEN lv_rate := .03 ;
        END IF ;
        
        lv_tax := lv_tax + ( lv_rate * myBasket.price * myBasket.quantity ) ;
        
        DBMS_OUTPUT.PUT_LINE( cur_Basket%ROWCOUNT ) ;
    END LOOP ;
    
    DBMS_OUTPUT.PUT_LINE( lv_tax ) ;


END ;