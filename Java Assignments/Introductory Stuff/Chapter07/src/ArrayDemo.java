// Eric Budd
// 24 November 2015
// This program will demonstrate how to use an array


public class ArrayDemo {

	public static void main(String[] args) {
		
		
		// Declare arrays
		
		
		int [ ]  numDaysArray  =  { 31 , 28 , 31 , 30 , 31 , 30 , 31 , 31 , 30 , 31 , 30 , 31 } ;
		
		String [ ]  monthNames  =  { "January" , "February" , "March" , "April" , "May" , "June" , "July" ,
									 "August" , "September" , "October" , "November" , "December" } ;
		
				
		
		
		// Loop through array
		
		
		if ( numDaysArray.length  ==  monthNames.length )
		
			for ( int i = 0  ;  i < numDaysArray.length  ;  i ++ )
				
				System.out.println ( monthNames [ i ]  +  " has "  +  numDaysArray [ i ]  +  " days." ) ;
		
		
		System.out.println();
		
		
		
		
		// Enhanced "for" loop  ( "for - each" )
		
		
		for ( String month  :  monthNames )
			System.out.println ( month ) ;
		
		
	}

}