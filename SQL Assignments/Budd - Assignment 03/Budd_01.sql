DECLARE

    TYPE rec_member IS RECORD (
        ID          MM_MEMBER.MEMBER_ID%TYPE ,
        firstName   MM_MEMBER.FIRST%TYPE ,
        lastName    MM_MEMBER.LAST%TYPE ,
        numRentals  NUMBER( 2 , 0 )
    ) ;
    
    memberInfo      rec_member ;


BEGIN

    memberInfo.ID := '&ID' ;
    
    SELECT      m.FIRST , m.LAST , COUNT( r.RENTAL_ID )
    INTO        memberInfo.firstName , memberInfo.lastName , memberInfo.numRentals
    FROM        MM_MEMBER m JOIN MM_RENTAL r USING ( MEMBER_ID )
    WHERE       MEMBER_ID = memberInfo.ID
    GROUP BY    MEMBER_ID , m.FIRST , m.LAST ;
    
    DBMS_OUTPUT.PUT_LINE( 'Member ID: ' || memberInfo.ID ) ;
    DBMS_OUTPUT.PUT_LINE( 'Member Name: ' || memberInfo.firstName || ' ' || memberInfo.lastName ) ;
    DBMS_OUTPUT.PUT_LINE( 'Number of rentals: ' || memberInfo.numRentals ) ;


END ;