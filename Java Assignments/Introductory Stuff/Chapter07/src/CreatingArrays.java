// Eric Budd
// 24 November 2015
// This program will demonstrate how to declare and initialize arrays

public class CreatingArrays {

	public static void main(String[] args) {
		
		
		int age1 = 33 ,
			age2 = 40 ,
			age3 = 21 ;
		
		System.out.println ( "Average age is " +   ( age1 + age2 + age3 )  /  3   + "." ) ;
		
		
		// Declare and initialize array
		
		int [ ]  ageArray  =  new int [ 5 ] ;
		
		ageArray [0]  =  33 ;
		ageArray [1]  =  40 ;
		ageArray [2]  =  21 ;
		ageArray [3]  =  37 ;
		ageArray [4]  =  18 ;
		
		int [ ]  ageArray2  =  { 33 , 40 , 21 , 37 , 18 } ;
		
		
	}

}
