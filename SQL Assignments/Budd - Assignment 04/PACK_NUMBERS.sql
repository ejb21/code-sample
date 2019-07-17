CREATE OR REPLACE PACKAGE pack_numbers IS
    
    PROCEDURE proc_numOrder
    (
        p_num1      IN      NUMBER ,
        p_num2      IN      NUMBER ,
        p_num3      IN      NUMBER ,
        p_sorted    OUT     VARCHAR
    ) ;

    FUNCTION func_avg
    (
        p_num1      IN      NUMBER ,
        p_num2      IN      NUMBER ,
        p_num3      IN      NUMBER
    )
    RETURN NUMBER ;

END ;