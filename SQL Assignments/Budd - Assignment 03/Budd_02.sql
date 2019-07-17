DECLARE

    TYPE rec_shopper IS RECORD (
        ID          BB_SHOPPER.IDSHOPPER%TYPE ,
        firstName   BB_SHOPPER.FIRSTNAME%TYPE ,
        lastName    BB_SHOPPER.LASTNAME%TYPE ,
        numOrders   NUMBER( 2 , 0 ) ,
        subtotal    NUMBER( 5 , 2 )
    ) ;
    
    shopperInfo     rec_shopper ;


BEGIN

    shopperInfo.ID := '&ID' ;
    
    SELECT      s.FIRSTNAME , s.LASTNAME , COUNT( b.ORDERPLACED ) , SUM( b.SUBTOTAL )
    INTO        shopperInfo.firstName , shopperInfo.lastName , shopperInfo.numOrders , shopperInfo.subtotal
    FROM        BB_SHOPPER s JOIN BB_BASKET b USING ( IDSHOPPER )
    WHERE       IDSHOPPER = shopperInfo.ID AND b.ORDERPLACED = 1
    GROUP BY    IDSHOPPER , s.FIRSTNAME , s.LASTNAME ;
    
    DBMS_OUTPUT.PUT_LINE( 'Shopper ID: ' || shopperInfo.ID ) ;
    DBMS_OUTPUT.PUT_LINE( 'Shopper Name: ' || shopperInfo.firstName || ' ' || shopperInfo.lastName ) ;
    DBMS_OUTPUT.PUT_LINE( 'Number of orders: ' || shopperInfo.numOrders ) ;
    DBMS_OUTPUT.PUT_LINE( 'Subtotal:' || TO_CHAR( shopperInfo.subtotal , '$900.00' ) ) ;


EXCEPTION

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE( 'Customer has no orders on record.' ) ;


END ;
