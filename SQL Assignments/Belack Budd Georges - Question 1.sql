/*  Creating a record of member's payment types for movie rentals  */

DECLARE

    TYPE type_invoice IS RECORD (
        memberFirst     MM_MEMBER.FIRST%TYPE ,
        memberLast      MM_MEMBER.LAST%TYPE ,
        paymentMethod   MM_PAY_TYPE.PAYMENT_METHODS%TYPE
    ) ;
    
    rec_invoice     type_invoice ;
    lv_rentalID     MM_RENTAL.RENTAL_ID%TYPE ;


BEGIN

    lv_rentalID := &lv_rentalID ;

    SELECT m.FIRST , m.LAST , p.PAYMENT_METHODS
        INTO rec_invoice.memberFirst , rec_invoice.memberLast , rec_invoice.paymentMethod
        FROM MM_MEMBER m JOIN MM_RENTAL r ON ( m.MEMBER_ID = r.MEMBER_ID ) JOIN MM_PAY_TYPE p ON ( r.PAYMENT_METHODS_ID = p.PAYMENT_METHODS_ID ) 
        WHERE r.RENTAL_ID = lv_rentalID ;
        
    DBMS_OUTPUT.PUT_LINE( 'Name: ' || rec_invoice.memberFirst || ' ' || rec_invoice.memberLast ) ;
    DBMS_OUTPUT.PUT_LINE( 'Payment method: ' || 
    rec_invoice.paymentMethod ) ;


END ;