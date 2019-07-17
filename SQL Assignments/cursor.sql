DECLARE

    -- DECLARE EXPLICIT CURSOR
    CURSOR cur_basket IS
        SELECT  bi.IDBASKET , p.TYPE , bi.PRICE , bi.QUANTITY
        FROM    BB_BASKETITEM bi JOIN BB_PRODUCT p
        USING   ( IDPRODUCT )
        WHERE   IDBASKET = 6 ;
    
    -- DECLARE RECORD VARIABLE
    TYPE type_basket IS RECORD (
        basketID        BB_BASKETITEM.IDBASKET%TYPE ,
        type            BB_PRODUCT.TYPE%TYPE ,
        price           BB_BASKETITEM.PRICE%TYPE ,
        quantity        BB_BASKETITEM.QUANTITY%TYPE
    ) ;
    
    -- CREATE VARIABLE FROM RECORD
    myBasket    type_basket ;
    
    -- CREATE LOCAL VARIABLES
    lv_rate     NUMBER( 2 , 2 ) ;
    lv_tax      NUMBER( 4 , 2 )     := 0 ;


BEGIN

    OPEN cur_basket ;
        LOOP
            FETCH cur_basket INTO myBasket ;
            EXIT WHEN cur_basket%NOTFOUND ;
            
            -- DETERMINE TYPE AND CALCULATE TAX
            IF myBasket.type = 'E'
                THEN lv_rate := .05 ;
            ELSIF myBasket.type = 'C'
                THEN lv_rate := .03 ;
            END IF ;
            
            lv_tax := lv_tax + ( lv_rate * myBasket.price * myBasket.quantity ) ;
        END LOOP ;
        
        DBMS_OUTPUT.PUT_LINE( cur_Basket%ROWCOUNT ) ;
    CLOSE cur_basket ;
    
    DBMS_OUTPUT.PUT_LINE( lv_tax ) ;


END ;