DECLARE

    stateAbbr   VARCHAR( 2 )    NOT NULL    := 'PA' ;
    paTax       CONSTANT NUMBER( 3 , 2 )    := .06 ;


BEGIN

    DBMS_OUTPUT.PUT_LINE( stateAbbr || ' has a sales tax of ' || TO_CHAR( paTax , '0.00' ) ) ;


END ;