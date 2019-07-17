DECLARE

    lv_projID       DD_PROJECT.IDPROJ%TYPE ;
    lv_projName     DD_PROJECT.PROJNAME%TYPE ;
    lv_numPledges   NUMBER( 3 , 0 ) ;
    lv_dolPledged   DD_PLEDGE.PLEDGEAMT%TYPE ;
    lv_avgPledge    DD_PLEDGE.PLEDGEAMT%TYPE ;


BEGIN

    lv_projID := &lv_projID ;
    
    SELECT      IDPROJ , PROJNAME
    INTO        lv_projID , lv_projName
    FROM        DD_PROJECT
    WHERE       IDPROJ = lv_projID ;
    
    SELECT      COUNT( IDPLEDGE ) , SUM( PLEDGEAMT ) , AVG( PLEDGEAMT )
    INTO        lv_numPledges , lv_dolPledged , lv_avgPledge
    FROM        DD_PLEDGE
    WHERE       IDPROJ = lv_projID ;
    
    DBMS_OUTPUT.PUT_LINE( 'Project ID: ' || lv_projID ) ;
    DBMS_OUTPUT.PUT_LINE( 'Project name: ' || lv_projName ) ;
    DBMS_OUTPUT.PUT_LINE( 'Number of pledges: ' || lv_numPledges ) ;
    DBMS_OUTPUT.PUT_LINE( 'Dollars pledged: $' || lv_dolPledged ) ;
    DBMS_OUTPUT.PUT_LINE( 'Average pledge amount: $' || lv_avgPledge ) ;


EXCEPTION

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE( 'Project not found.' ) ;
    


END ;