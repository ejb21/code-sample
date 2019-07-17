// Eric Budd
// 20 September 2015
// This program will use the LOGICAL AND operator to allow entry to the secret society

import java.util.Random;
import java.util.Scanner;

public class SSLogicalAnd {

	public static void main(String[] args) {
		
		
		// Declare variables and objects
		final String NOODLES = "Noodles";
		String password;
		int diceGuess;
		
		Random rando = new Random();
		Scanner typetype = new Scanner(System.in);
		
		
		// Ask user for password, number and test
		System.out.print("PASSWORD? ");
		password = typetype.nextLine();
		System.out.print("Now guess this dice roll. ");
		diceGuess = typetype.nextInt();
		
		
		// Test with LOGICAL AND
		if(password.equalsIgnoreCase(NOODLES) && diceGuess == (rando.nextInt(6) + 1))
		{
			System.out.println("\nIlluminati confirmed");
		}
		else
		{
			System.out.println("\nGTFO");
		}
		
		
		// Test with LOGICAL OR
		if(password.equalsIgnoreCase(NOODLES) || diceGuess == (rando.nextInt(6) + 1))
		{
			System.out.println("You got one right.");
		}
		else
		{
			System.out.println("n00b");
		}
		
		
		// Close Scanner
		typetype.close();
		
	}

}