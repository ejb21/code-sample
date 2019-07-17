// Eric Budd
// 8 December 2015
// This program will search a file for a csvzip code and return the user's city/state


import  java.io.* ;
import  java.util.Scanner ;

public class Budd_ProgrammingAssignment05
{

	public static void main(String[] args) throws FileNotFoundException
	{
		
		int  index1 , index2 ;
		String  name , address , city , state , zip = "" , csvzip = "" , csvzip2 ;
		
		File zips  =  new File ( "zips.csv" ) ;
		Scanner scanscan  =  new Scanner ( zips ) ;
		Scanner typetype  =  new Scanner ( System.in ) ;
		PrintWriter printwrite  =  new PrintWriter ( "Address.txt" ) ;
		
		
		System.out.print ( "What is your full name? " ) ;
		name  =  typetype.nextLine() ;
		
		System.out.print ( "What is your street address? " ) ;
		address  =  typetype.nextLine() ;
		
		System.out.print ( "What is your ZIP code? " ) ;
		zip  =  typetype.nextLine() ;
		
		
		do
		{
			csvzip  =  scanscan.nextLine() ;
			csvzip2  =  csvzip ;
			csvzip  =  csvzip.substring( 0 , csvzip.indexOf( "," ) ) ;
			
			if ( csvzip.length() != 5 )
				csvzip = "0" + csvzip ;
		}
		while ( !csvzip.equals( zip ) ) ;
		
		
		index1  =  csvzip2.indexOf( "," ) + 1 ;
		index2  =  index1 + 2 ;
		state  =  csvzip2.substring( index1 , index2 ) ;
		
		index1  =  index2 + 1 ;
		index2  =  csvzip2.length() ;
		city  =  csvzip2.substring( index1 , index2 ) ;
		csvzip2  =  city ;		
		city  =  csvzip2.substring( 1 , csvzip2.length() ) ;
		city  =  city.toLowerCase();
		city  =  csvzip2.charAt( 0 ) + city ;
		
		
		printwrite.println ( name ) ;
		printwrite.println ( address ) ;
		printwrite.println ( city + ", " + state + " " + zip ) ;
		
		
		scanscan.close() ;
		typetype.close() ;
		printwrite.close() ;
		
	}

}