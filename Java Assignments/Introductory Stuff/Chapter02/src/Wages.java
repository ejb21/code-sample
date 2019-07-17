// Eric Budd
// 27 August 2015
// This program will calculate wages

public class Wages {

	public static void main(String[] args) {
		
		// Declare variables
		double regularWages,
			   basePay        =  25,
			   regularHours   =  40,		// Comment
			   overtimeWages,				// Comment
			   overtimePay    =  37.5,
			   overtimeHours  =  10;
		
		// Perform calculations
		regularWages   =  (basePay * regularHours);
		overtimeWages  =  (overtimePay * overtimeHours);
		
		// Print results
		System.out.println ("Wages for this week are: $" + (regularWages + overtimeWages) + 0);

	}

}
