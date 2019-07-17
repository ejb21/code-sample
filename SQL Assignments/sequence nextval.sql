DECLARE

    lv_fn   BB_SHOPPER.FIRSTNAME%TYPE := 'Eric' ;
    lv_ln   BB_SHOPPER.LASTNAME%TYPE := 'Budd' ;
    lv_em   BB_SHOPPER.EMAIL%TYPE := 'ejb21@pct.edu' ;


BEGIN

    INSERT INTO     BB_SHOPPER( IDSHOPPER , FIRSTNAME , LASTNAME , EMAIL )
    VALUES          ( BB_SHOPPER_SEQ.NEXTVAL , lv_fn , lv_ln , lv_em ) ;
    COMMIT ;


END;