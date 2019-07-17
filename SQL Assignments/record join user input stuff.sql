DECLARE

    TYPE type_movieInfo IS RECORD (
        id          mm_movie.movie_id%TYPE ,
        title       mm_movie.movie_title%TYPE ,
        category    mm_movie_type.movie_category%TYPE
    ) ;
    
    myMovie     type_movieInfo ;


BEGIN

    myMovie.id := &movieID ;
    
    SELECT movie_title , movie_category
        INTO myMovie.title , myMovie.category
        FROM mm_movie JOIN mm_movie_type USING ( movie_cat_id )
            WHERE movie_id = myMovie.id ;
    
    DBMS_OUTPUT.PUT_LINE( 'ID: ' || myMovie.id ) ;
    DBMS_OUTPUT.PUT_LINE( 'Title: ' || myMovie.title ) ;
    DBMS_OUTPUT.PUT_LINE( 'Category: ' || myMovie.category ) ;


END ;