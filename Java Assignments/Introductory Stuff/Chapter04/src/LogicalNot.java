// Eric Budd
// 20 October 2015
// This program will show boolean variables in "if" conditions and use the logical not

import java.util.Scanner;
import java.util.Calendar;

public class LogicalNot {

	public static void main(String[] args) {
		
		
		// Declare variables and objects
		boolean flag = false;
		String weekday;
		String actualWeekday = "";
		Scanner typetype = new Scanner(System.in);
		
		
		// Get user input
		System.out.print("What day is your appointment? ");
		weekday = typetype.nextLine();
		
		
		// Get the current day of the week as a number
		Calendar calendar = Calendar.getInstance();
		int day = calendar.get(Calendar.DAY_OF_WEEK);
		
		
		// Convert the number to the name of the day
		switch(day)
		{
			case 1:
				actualWeekday = "Sunday";
				break;
			case 2:
				actualWeekday = "Monday";
				break;
			case 3:
				actualWeekday = "Tuesday";
				break;
			case 4:
				actualWeekday = "Wednesday";
				break;
			case 5:
				actualWeekday = "Thursday";
				break;
			case 6:
				actualWeekday = "Friday";
				break;
			case 7:
				actualWeekday = "Saturday";
				break;
		}
		
		
		// Test to see if days are equal
		if(!weekday.equalsIgnoreCase(actualWeekday))
		{
			System.out.println("\nWrong weekday, chum.");
		}
		else
		{
			System.out.println("\nThat's today!!");
			flag = true;
		}
		
		
		// Let's pretend there are 10000 lines of code here
		if(flag)
		{
			System.out.println(flag);
		}
		
		
		// Close Scanner object
		typetype.close();

	}

}
