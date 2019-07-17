DECLARE

    TYPE type_product IS TABLE OF BB_PRODUCT%ROWTYPE
        INDEX BY BINARY_INTEGER ;
    
    myProducts  type_product ;


BEGIN

    SELECT * BULK COLLECT INTO myProducts
        FROM BB_PRODUCT
        WHERE TYPE = 'E' ;


END ;