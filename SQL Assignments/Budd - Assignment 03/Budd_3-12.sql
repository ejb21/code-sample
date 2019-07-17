DECLARE

    TYPE rec_pledge IS RECORD (
        pledgeID    DD_PLEDGE.IDPLEDGE%TYPE ,
        donorID     DD_PLEDGE.IDDONOR%TYPE ,
        amount      DD_PLEDGE.PLEDGEAMT%TYPE ,
        paid        DD_PAYMENT.PAYAMT%TYPE ,
        difference  DD_PAYMENT.PAYAMT%TYPE
    ) ;
    
    myPledge        rec_pledge ;


BEGIN

    myPledge.pledgeID := '&PledgeID' ;

    SELECT      pl.IDDONOR , pl.PLEDGEAMT , SUM( pa.PAYAMT ) , ( pl.PLEDGEAMT - SUM( pa.PAYAMT ) )
    INTO        myPledge.donorID , myPledge.amount , mypledge.paid , myPledge.difference
    FROM        DD_PLEDGE pl JOIN DD_PAYMENT pa USING ( IDPLEDGE )
    WHERE       IDPLEDGE = myPledge.pledgeID
    GROUP BY    IDPLEDGE, pl.IDDONOR, pl.PLEDGEAMT, pa.PAYAMT ;
    
    DBMS_OUTPUT.PUT_LINE( 'Pledge ID: ' || myPledge.pledgeID ) ;
    DBMS_OUTPUT.PUT_LINE( 'Donor ID: ' || myPledge.donorID ) ;
    DBMS_OUTPUT.PUT_LINE( 'Pledge Amount: ' || myPledge.amount ) ;
    DBMS_OUTPUT.PUT_LINE( 'Amount Paid: ' || myPledge.paid ) ;
    DBMS_OUTPUT.PUT_LINE( 'Amount Left: ' || myPledge.difference ) ;


END ;
