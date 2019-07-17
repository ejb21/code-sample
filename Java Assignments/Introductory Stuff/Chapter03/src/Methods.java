// Eric Budd
// 15 September 2015
// This program will demonstrate how to create and use methods.

import java.util.Scanner;

public class Methods {

	public static void main(String[] args) {
		
		// Declare some variables and objects
		String firstName, lastName;
		Scanner keyScan = new Scanner (System.in);
				
		// Ask user for name
		System.out.print("What is your first name? ");
		firstName = keyScan.nextLine();
		System.out.print("What is your last name? ");
		lastName = keyScan.nextLine();
		
		// Pass variables to method
		greetings(firstName, lastName);
		
		// Ask user for name
		System.out.print("What is your first name? ");
		firstName = keyScan.nextLine();
		System.out.print("What is your last name? ");
		lastName = keyScan.nextLine();
		
		// Pass variables to method
		greetings(firstName, lastName);
		
		// Close Scanner object
		keyScan.close();
		
	}
	
	public static void greetings(String fN, String lN){
		
		System.out.println("\nHello, " + fN + " " + lN + "!");
		System.out.println("Welcome to my awesome program.");
		System.out.println();
		
	}

}






