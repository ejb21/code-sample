DECLARE

    rec_department      BB_DEPARTMENT%ROWTYPE ;


BEGIN

    SELECT ( MAX( idDepartment ) + 1 ) INTO rec_department.idDepartment FROM bb_department ;

    rec_department.deptName := 'Creamer' ;
    rec_department.deptDesc := 'Stuff that you put into coffee' ;
    
    INSERT INTO bb_department
    VALUES rec_department ;


END ;