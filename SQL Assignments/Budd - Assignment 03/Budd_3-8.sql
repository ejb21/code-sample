DECLARE

    TYPE rec_basket IS RECORD (
        ID          BB_BASKET.IDBASKET%TYPE     := 12 ,
        subtotal    BB_BASKET.SUBTOTAL%TYPE ,
        shipping    BB_BASKET.SHIPPING%TYPE ,
        tax         BB_BASKET.TAX%TYPE ,
        total       BB_BASKET.TOTAL%TYPE
    ) ;
    
    myBasket        rec_basket ;


BEGIN

    SELECT  SUBTOTAL , SHIPPING , TAX , TOTAL
    INTO    myBasket.subtotal , myBasket.shipping , myBasket.tax , myBasket.total
    FROM    BB_BASKET
    WHERE   IDBASKET = myBasket.ID ;
    
    DBMS_OUTPUT.PUT_LINE( 'Basket ID: ' || myBasket.ID ) ;
    DBMS_OUTPUT.PUT_LINE( 'Subtotal: ' || myBasket.subtotal ) ;
    DBMS_OUTPUT.PUT_LINE( 'Shipping: ' || myBasket.shipping ) ;
    DBMS_OUTPUT.PUT_LINE( 'Tax: ' || myBasket.tax ) ;
    DBMS_OUTPUT.PUT_LINE( 'Total: ' || myBasket.total ) ;


END ;
