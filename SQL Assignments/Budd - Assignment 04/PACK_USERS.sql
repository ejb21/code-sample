CREATE OR REPLACE PACKAGE pack_users IS
    
    PROCEDURE proc_userInfo
    (
        p_id            IN      NUMBER ,
        p_userName      OUT     VARCHAR
    ) ;

    PROCEDURE proc_userInfo
    (
        p_firstName     IN      VARCHAR ,
        p_userName      OUT     VARCHAR
    ) ;

    PROCEDURE proc_userInfo
    (
        p_lastName      IN      VARCHAR ,
        p_userName      OUT     VARCHAR
    ) ;

END ;