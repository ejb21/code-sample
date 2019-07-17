// Eric Budd
// 1 December 2015
// This program will search an array for a certain value and return the subscript

// "pop search" -- pretty cool -- won't be doing them in class


public class ArraySearch {
	

	public static void main ( String[ ] args )
	{
		
		
		int		 result ;
		int[ ]   testArray = { 87 , 95 , 83 , 100 , 53 } ;
		
		
		result  =  testSearch ( testArray , 100 ) ;
		
		
		if ( result == -1 )
			System.out.println ( "You did not earn a 100% grade on any test." ) ;
		
		else
			System.out.println ( "You earned a 100% grade on test #" + ( result + 1 ) + "." ) ;
		
		
	}
	
	
	public static int testSearch ( int[ ] array , int value )
	{
		
		
		int   	  index = 0 ,
				  subscript = -1 ;
		
		boolean   found = false ;
		
		
		while ( !found  &&  index < array.length )
		{
			
			if ( array[ index ] == value )
			{
				subscript = index ;
				found = true ;
			}
			
			index ++ ;
		
		}
		
		return subscript ;
		
		
	}

}