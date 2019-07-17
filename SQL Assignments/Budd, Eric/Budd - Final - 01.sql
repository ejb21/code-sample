DECLARE

    lv_avgPrice     BB_PRODUCT.PRICE%TYPE ;
    
    TYPE type_covfefe IS TABLE OF BB_PRODUCT%ROWTYPE
        INDEX BY BINARY_INTEGER ;
    
    myCovfefe       type_covfefe ;


BEGIN

    SELECT      AVG( PRICE )
    INTO        lv_avgPrice
    FROM        BB_PRODUCT
    WHERE       TYPE = 'C' ;
    
    SELECT      * BULK COLLECT
    INTO        myCovfefe
    FROM        BB_PRODUCT
    WHERE       PRICE > lv_avgPrice AND TYPE = 'C' ;
    
    DBMS_OUTPUT.PUT_LINE( 'The following covfefe items cost more than the average price of $' || lv_avgPrice || ':' ) ;
    DBMS_OUTPUT.PUT_LINE( '' ) ;
    
    FOR i IN 1..100 LOOP
        IF myCovfefe.EXISTS( i ) THEN
            DBMS_OUTPUT.PUT_LINE( 'Product ID: ' || myCovfefe( i ).IDPRODUCT ) ;
            DBMS_OUTPUT.PUT_LINE( 'Product name: ' || myCovfefe( i ).PRODUCTNAME ) ;
            DBMS_OUTPUT.PUT_LINE( 'Product price: $' || myCovfefe( i ).PRICE ) ;
            DBMS_OUTPUT.PUT_LINE( '' ) ;
        ELSE
            EXIT ;
        END IF ;
    END LOOP ;


END ;