CREATE OR REPLACE PACKAGE BODY pack_numbers AS

  PROCEDURE proc_numOrder
    (
        p_num1      IN      NUMBER ,
        p_num2      IN      NUMBER ,
        p_num3      IN      NUMBER ,
        p_sorted    OUT     VARCHAR
    )  AS
  BEGIN
    
    IF p_num1 > p_num2 AND p_num1 > p_num3 THEN
        IF p_num2 > p_num3 THEN
            p_sorted := p_num3 || ', ' || p_num2 || ', ' || p_num1 ;
        ELSE
            p_sorted := p_num2 || ', ' || p_num3 || ', ' || p_num1 ;
        END IF ;
    ELSIF p_num2 > p_num1 AND p_num2 > p_num3 THEN
        IF p_num1 > p_num3 THEN
            p_sorted := p_num3 || ', ' || p_num1 || ', ' || p_num2 ;
        ELSE
            p_sorted := p_num1 || ', ' || p_num3 || ', ' || p_num2 ;
        END IF ;
    ELSE
        IF p_num1 > p_num2 THEN
            p_sorted := p_num2 || ', ' || p_num1 || ', ' || p_num3 ;
        ELSE
            p_sorted := p_num1 || ', ' || p_num2 || ', ' || p_num3 ;
        END IF ;
    END IF ;
    
  END proc_numOrder;
  

  FUNCTION func_avg
    (
        p_num1      IN      NUMBER ,
        p_num2      IN      NUMBER ,
        p_num3      IN      NUMBER
    )
    RETURN NUMBER  AS
    
    lv_avg      NUMBER( 3 , 1 ) ;
    
    
  BEGIN
    
    lv_avg := ( p_num1 + p_num2 + p_num3 ) / 3 ;
    
    RETURN lv_avg ;
    
  END func_avg;

END PACK_NUMBERS;