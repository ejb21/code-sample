// Eric Budd
// 1 September 2015
// This program accepts input from the user

import java.util.Scanner;

public class UserInput {

	public static void main(String[] args) {
		
		// Declare variables
		String name;
		
		// Create objects
		Scanner keyboard = new Scanner(System.in);
		
		// Ask their name
		System.out.print("What is your name? ");
		name = keyboard.nextLine();
		
		// Print results
		System.out.println(name);
		
		// Close Scanner
		keyboard.close();
		
	}

}
