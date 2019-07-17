// Eric Budd
// 13 September 2015
// This program will allow a user access if they type the secret password and guess the correct dice number

import java.util.Random;
import java.util.Scanner;

public class SecretSociety {

	public static void main(String[] args) {
		
		// Declare variables and objects
		final String NOODLES = "Noodles";
		String password;
		int diceGuess;
		
		Random rando = new Random();
		Scanner typetype = new Scanner(System.in);
		
		// Ask user for password and test
		System.out.print("WHAT IS PASSWORD. ");
		password = typetype.nextLine();
		
		if(password.equalsIgnoreCase(NOODLES))
		{
			System.out.print("That... might be correct. Now guess this dice roll. ");
			diceGuess = typetype.nextInt();
			if(diceGuess == (rando.nextInt(6) + 1))
			{
				System.out.println("Illuminati confirmed");
			}
			else
			{
				System.out.println("Wrong! Get the fuck out.");
			}
		}
		else
		{
			System.out.println("Wrong! Get the fuck out.");
		}
		
		// Close Scanner
		typetype.close();
		
	}

}
