DECLARE

    lv_num1         NUMBER( 2 )     := 17 ;
    lv_num2         NUMBER( 2 )     := 97 ;
    lv_num3         NUMBER( 2 )     := 37 ;
    lv_avg          NUMBER( 3 , 1 ) ;
    lv_sorted       VARCHAR2( 10 ) ;
    
    lv_id           NUMBER( 3 )     := 15 ;
    lv_firstName    VARCHAR2( 25 )  := 'Pete' ;
    lv_lastName     VARCHAR2( 25 )  := 'Parker' ;
    lv_userName     VARCHAR2( 25 ) ;


BEGIN

    -- INSERT INTO MM_MEMBER ( MEMBER_ID , LAST , FIRST ) VALUES ( 15 , 'Parker' , 'Pete' ) ;

    lv_avg := pack_numbers.func_avg( lv_num1 , lv_num2 , lv_num3 ) ;
    pack_numbers.proc_numOrder( p_num1 => lv_num1 , p_num2 => lv_num2 , p_num3 => lv_num3 , p_sorted => lv_sorted ) ;
    
    DBMS_OUTPUT.PUT_LINE( lv_avg ) ;
    DBMS_OUTPUT.PUT_LINE( lv_sorted ) ;
    
    
    DBMS_OUTPUT.PUT_LINE( '' ) ;
    
    
    pack_users.proc_userInfo( p_id => lv_id , p_userName => lv_userName ) ;
    DBMS_OUTPUT.PUT_LINE( lv_userName ) ;
    
    pack_users.proc_userInfo( p_firstName => lv_firstName , p_userName => lv_userName ) ;
    DBMS_OUTPUT.PUT_LINE( lv_userName ) ;
    
    pack_users.proc_userInfo( p_lastName => lv_lastName , p_userName => lv_userName ) ;
    DBMS_OUTPUT.PUT_LINE( lv_userName ) ;
    
    
    DBMS_OUTPUT.PUT_LINE( '' ) ;
    
    
    lv_id := 21 ;
    lv_firstName := 'John' ;
    lv_lastName := 'Carter' ;
    
    
    pack_users.proc_userInfo( p_id => lv_id , p_userName => lv_userName ) ;
    DBMS_OUTPUT.PUT_LINE( lv_userName ) ;
    
    pack_users.proc_userInfo( p_firstName => lv_firstName , p_userName => lv_userName ) ;
    DBMS_OUTPUT.PUT_LINE( lv_userName ) ;
    
    pack_users.proc_userInfo( p_lastName => lv_lastName , p_userName => lv_userName ) ;
    DBMS_OUTPUT.PUT_LINE( lv_userName ) ;
    

END ;