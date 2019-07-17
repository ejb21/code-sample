CREATE OR REPLACE PROCEDURE proc_orderStatus
(
    p_basketID      IN NUMBER ,
    p_status        OUT VARCHAR
)

AS

    CURSOR cur_status IS
        SELECT      IDSTAGE
        FROM        BB_BASKETSTATUS
        WHERE       IDBASKET = p_basketID
        ORDER BY    DTSTAGE DESC ;
    
    rec_status      BB_BASKETSTATUS%ROWTYPE ;
    lv_statusID     BB_BASKETSTATUS.IDSTAGE%TYPE ;

BEGIN

    OPEN cur_status ;
        FETCH cur_status INTO lv_statusID ;
    CLOSE cur_status ;
    
    CASE
        WHEN lv_statusID = 1 THEN
            p_status := 'Submitted and received' ;
        WHEN lv_statusID = 2 THEN
            p_status := 'Confirmed, processed, and sent to shipping' ;
        WHEN lv_statusID = 3 THEN
            p_status := 'Shipped' ;
        WHEN lv_statusID = 4 THEN
            p_status := 'Canceled' ;
        WHEN lv_statusID = 5 THEN
            p_status := 'Back-ordered' ;
    END CASE ;


EXCEPTION

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE( 'Basket not found.' ) ;
    
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE( 'Basket not found.' ) ;


END ;