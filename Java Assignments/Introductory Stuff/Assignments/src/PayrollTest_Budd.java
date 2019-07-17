// Eric Budd
// 19 October 2015
// Programming Assignment 2: Electric Boogaloo


import java.util.Scanner;


public class PayrollTest_Budd {

	public static void main(String[] args) {
		
		
		// Variables
		
		int hoursWorked;
		double payRate;
		
		
		// Objects
		
		Payroll_Budd pay1 = new Payroll_Budd();
		Scanner keyscan = new Scanner(System.in);
		
		
		// User input and mutators
		
		System.out.print("What is your hourly wage? ");
		payRate = keyscan.nextDouble();
		pay1.setWage(payRate);
		
		System.out.print("How many hours did you work this week? ");
		hoursWorked = keyscan.nextInt();
		pay1.setHours(hoursWorked);
		
		
		// Output
		
		System.out.printf("\nYour gross pay for this week is $%.2f.", pay1.getPaycheck());
		
		
		// Close Scanner object
		
		keyscan.close();
		
		
	}
}