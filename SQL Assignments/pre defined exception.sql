DECLARE

    ex_quantity_value       EXCEPTION ;
    PRAGMA                  EXCEPTION_INIT( ex_quantity_value , -2290 ) ;


BEGIN

    INSERT INTO     BB_BASKETITEM
    VALUES          ( 95 , 8 , 10.5 , 25 , 16 , 2 , 3 ) ;


EXCEPTION

    WHEN ex_quantity_value THEN
        DBMS_OUTPUT.PUT_LINE( 'Invalid quantity value.' ) ;


END ;