/*
    DECISION STRUCTURES
    ———————————
    
    IF THEN
    IF THEN ELSE
    IF THEN ELSIF ELSE
    
    CASE STATEMENTS
    CASE EXPRESSIONS
*/

DECLARE

    stateAbbr       VARCHAR2( 2 ) ;
    stateName       VARCHAR2( 25 ) ;
    taxRate         NUMBER( 6 , 5 ) ;
    region          VARCHAR2( 25 ) ;
    stateCapital    VARCHAR2( 25 ) ;
    stateBird       VARCHAR2( 25 ) ;


BEGIN

    stateAbbr := '&stateAbbr' ;
    
    IF stateAbbr = 'PA' THEN
        stateName := 'Pennsylvania' ;
        taxRate := .06 ;
        
    ELSIF stateAbbr = 'CA' THEN
        stateName := 'California' ;
        taxRate := .08875 ;
        
    ELSIF stateAbbr = 'NY' THEN
        stateName := 'New York' ;
        taxRate := .0725 ;
        
    ELSE
        stateName := 'Error' ;
        taxRate := 0 ;
        
    END IF ;
    
    
    DBMS_OUTPUT.PUT_LINE( 'State name: ' || stateName ) ;
    DBMS_OUTPUT.PUT_LINE( 'Tax rate: ' || taxRate ) ;
    
    
    --  DETERMINE REGION BASED ON STATE ABBREVIATION
    
    IF stateAbbr = 'PA' OR stateAbbr = 'NY' THEN
        region := 'Northeast' ;
    
    ELSE
        region := 'Southwest' ;
    
    END IF ;
    
    
    DBMS_OUTPUT.PUT_LINE( 'Region: ' || region ) ;
    
    
    --  DETERMINE STATE CAPITAL BASED ON STATE USING CASE STATEMENT
    
    CASE stateAbbr
        WHEN 'PA' THEN stateCapital := 'Harrisburg' ;
        WHEN 'CA' THEN stateCapital := 'Sacramento' ;
        WHEN 'NY' THEN stateCapital := 'Albany' ;
    END CASE ;
    
    DBMS_OUTPUT.PUT_LINE( 'Capital: ' || stateCapital ) ;
    
    
    --  DETERMINE STATE BIRD BASD ON STATE USING CASE EXPRESSION
    
    stateBird := CASE stateAbbr
        WHEN 'PA' THEN 'Ruffed Grouse'
        WHEN 'CA' THEN 'California Valley Quail'
        WHEN 'NY' THEN 'Bluebird'
    END ;
    
    
    DBMS_OUTPUT.PUT_LINE( 'State bird: ' || stateBird ) ;


END ;