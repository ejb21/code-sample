// Eric Budd
// 27 October 2015
// This program will accept a birthday as input and determine your astrological sign

import java.util.Scanner;

public class AstrologicalSign {

	public static void main(String[] args) {
		
		// Declare variables and objects
		String birthday;
		String month;
		int day, year;
		Scanner typetype = new Scanner(System.in);
		
		// Get user input
		System.out.print("What is your birthday ([Month] [DD], [YYYY])? ");
		birthday = typetype.nextLine();
		
		// Split input into respective variables
		month = birthday.substring(0, birthday.indexOf(" "));
		day = Integer.parseInt(birthday.substring(birthday.indexOf(" ") + 1, birthday.indexOf(",")));
		year = Integer.parseInt(birthday.substring(birthday.indexOf(",") + 2));
		
		// Determine sign
		String output = "";
		
		switch(month.toLowerCase())
		{
		case "january":
			if (day <= 19)
				System.out.println("You are a Capricorn.");
			else
				System.out.println("You are an Aquarius.");
			break;
			
		case "february":
			System.out.println("You are " + (day <= 18 ? "an Aquarius." : "a Pisces."));
			break;
			
		case "march":
			output = day <= 20 ? "Pisces" : "Aries";
			break;
			
		case "april":
			output = day <= 19 ? "Aries" : "Taurus";
			break;
			
		case "may":
			output = day <= 20 ? "Taurus" : "Gemini";
			break;
			
		case "june":
			output = day <= 20 ? "Gemini" : "Cancer";
			break;
			
		case "july":
			output = day <= 22 ? "Cancer" : "Leo";
			break;
			
		case "august":
			output = day <= 22 ? "Leo" : "Virgo";
			break;
			
		case "september":
			output = day <= 21 ? "Virgo" : "Libra";
			break;
			
		case "october":
			output = day <= 23 ? "Libra" : "Scorpio";
			break;
			
		case "november":
			output = day <= 21 ? "Scorpio" : "Sagittarius";
			break;
			
		case "december":
			output = day <= 21 ? "Sagittarius" : "Capricorn";
			break;
			
		default:
			output = "u w0t m8";
		}
		
		System.out.println("You are a(n) " + output + ".");
		
		// Close Scanner object
		typetype.close();
		
	}

}
