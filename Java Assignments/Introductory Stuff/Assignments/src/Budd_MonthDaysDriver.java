// Eric Budd
// 5 November 2015
// Programming assignment #3

import java.util.Scanner;

public class Budd_MonthDaysDriver {

	public static void main(String[] args) {
		
		int numDays;
		Scanner typetype = new Scanner(System.in);
		Budd_MonthDays test = new Budd_MonthDays();
		
		System.out.print("What year is it? ");
		test.setYear(typetype.nextInt());
		
		System.out.print("And what month is it (1-12)? ");
		test.setMonth(typetype.nextInt());
		
		numDays = test.getNumberOfDays();
		
		System.out.println("\nThere are " + numDays + " days in this month.");
		
	}

}
