// Eric Budd
// 27 August 2015
// This program will declare different types of integer variables

public class IntegerVariables {

	public static void main(String[] args) {
		
		// Declare variables
		byte   miles;
		short  minutes;
		int    checking;
		long   days;
		
		//Assign variables
		miles     =  105;
		minutes   =  120;
		checking  =  -20;
		days      =  189000;
		
		// Print out variables
		System.out.print   ("We have journeyed " + miles);
		System.out.println (" miles. ");
		System.out.println ("It took us " + minutes + " minutes.");
		System.out.println ("Our account balance is $" + checking + ".");
		System.out.println ("About " + days + " days ago, Columbus stood at this spot.");

	}

}
