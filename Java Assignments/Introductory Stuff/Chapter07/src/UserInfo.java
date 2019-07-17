// Eric Budd
// 24 November 2015
// This program will demonstrate how to split a string into an array


import java.util.Scanner ;


public class UserInfo {

	public static void main(String[] args) {
		
		
		String input ;
		Scanner typetype  =  new Scanner ( System.in ) ;
		
		
		System.out.println ( "What is your birthday? " ) ;
		
		input  =  typetype.nextLine () ;
		
		System.out.println();
		
		
		String [ ]  birthdayArray  =  input.replace ( "," , "" )  .split ( " " ) ;
		
		System.out.println ( birthdayArray [ 0 ] ) ;
		System.out.println ( birthdayArray [ 1 ] ) ;
		System.out.println ( birthdayArray [ 2 ] ) ;
		
		
		
	}

}
