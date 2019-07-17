DECLARE

    TYPE type_midterm IS TABLE OF BB_BASKETITEM%ROWTYPE
        INDEX BY BINARY_INTEGER ;
    
    myTable         type_midterm ;
    lv_product      BB_PRODUCT.PRODUCTNAME%TYPE ;


BEGIN

    SELECT      * BULK COLLECT
    INTO        myTable
    FROM        BB_BASKETITEM
    WHERE       OPTION2 = 4 ;
    
    FOR i IN 1..myTable.COUNT LOOP
        SELECT  PRODUCTNAME
        INTO    lv_product
        FROM    BB_PRODUCT
        WHERE   IDPRODUCT = myTable( i ).IDPRODUCT ;
        
        DBMS_OUTPUT.PUT_LINE( 'Product: ' || lv_product || '; Price: $' || TO_CHAR( myTable( i ).PRICE , '90.00' ) ) ;
    END LOOP ;


END ;