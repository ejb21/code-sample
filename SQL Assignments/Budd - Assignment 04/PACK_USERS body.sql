CREATE OR REPLACE PACKAGE BODY PACK_USERS AS

  CURSOR bbCursor IS
    SELECT  IDSHOPPER , FIRSTNAME , LASTNAME
    FROM    BB_SHOPPER ;

  CURSOR ddCursor IS
    SELECT  IDDONOR , FIRSTNAME , LASTNAME
    FROM    DD_DONOR ;

  CURSOR mmCursor IS
    SELECT  MEMBER_ID , FIRST , LAST
    FROM    MM_MEMBER ;





 FUNCTION func_userName ( f_id   IN  NUMBER )
  RETURN VARCHAR AS
  
    lv_firstName    VARCHAR( 25 ) ;
    lv_lastName     VARCHAR( 25 ) ;
    lv_userName     VARCHAR( 25 ) ;
    
  BEGIN
  
    FOR thing IN bbCursor LOOP
        IF thing.IDSHOPPER = f_id THEN
            lv_firstName := thing.FIRSTNAME ;
            lv_lastName := thing.LASTNAME ;
        END IF ;
    END LOOP ;
  
    FOR thing IN ddCursor LOOP
        IF thing.IDDONOR = f_id THEN
            lv_firstName := thing.FIRSTNAME ;
            lv_lastName := thing.LASTNAME ;
        END IF ;
    END LOOP ;
  
    FOR thing IN mmCursor LOOP
        IF thing.MEMBER_ID = f_id THEN
            lv_firstName := thing.FIRST ;
            lv_lastName := thing.LAST ;
        END IF ;
    END LOOP ;
  
    lv_userName := SUBSTR( lv_firstName , 0 , 1 ) || '. ' || lv_lastName ;
    RETURN lv_userName ;
    
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE( 'No data found.' ) ;
  
  END func_userName ;






  PROCEDURE proc_userInfo
    (
        p_id            IN      NUMBER ,
        p_userName      OUT     VARCHAR
    )  AS
  BEGIN
    
    p_userName := func_userName( p_id ) ;
    
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE( 'No data found.' ) ;
    
  END proc_userInfo;



  PROCEDURE proc_userInfo
    (
        p_firstName     IN      VARCHAR ,
        p_userName      OUT     VARCHAR
    )  AS
    
    lv_id   VARCHAR( 3 ) ;
    
  BEGIN
    
    FOR thing IN bbCursor LOOP
        IF thing.FIRSTNAME = p_firstName THEN
            lv_id := thing.IDSHOPPER ;
        END IF ;
    END LOOP ;
    
    FOR thing IN ddCursor LOOP
        IF thing.FIRSTNAME = p_firstName THEN
            lv_id := thing.IDDONOR ;
        END IF ;
    END LOOP ;
    
    FOR thing IN mmCursor LOOP
        IF thing.FIRST = p_firstName THEN
            lv_id := thing.MEMBER_ID ;
        END IF ;
    END LOOP ;
    
    p_userName := func_userName( lv_id ) ;
    
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE( 'No data found.' ) ;
    
  END proc_userInfo;



  PROCEDURE proc_userInfo
    (
        p_lastName      IN      VARCHAR ,
        p_userName      OUT     VARCHAR
    )  AS
    
    lv_id   VARCHAR( 3 ) ;
    
  BEGIN
    
    FOR thing IN bbCursor LOOP
        IF thing.LASTNAME = p_lastName THEN
            lv_id := thing.IDSHOPPER ;
        END IF ;
    END LOOP ;
    
    FOR thing IN ddCursor LOOP
        IF thing.LASTNAME = p_lastName THEN
            lv_id := thing.IDDONOR ;
        END IF ;
    END LOOP ;
    
    FOR thing IN mmCursor LOOP
        IF thing.LAST = p_lastName THEN
            lv_id := thing.MEMBER_ID ;
        END IF ;
    END LOOP ;
    
    p_userName := func_userName( lv_id ) ;
    
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE( 'No data found.' ) ;
  
  END proc_userInfo;




END PACK_USERS;