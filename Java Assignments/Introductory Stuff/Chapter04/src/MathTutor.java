// Eric Budd
// 13 September 2015
// This program will generate two random numbers and ask the user to add them

import java.util.Random;
import java.util.Scanner;

public class MathTutor {

	public static void main(String[] args) {
		
		// Declare variables and objects
		int num1, num2, sum;
		Random rando = new Random();
		Scanner typetype = new Scanner(System.in);
		
		// Range from ~-2,000,000,000 to ~2,000,000,000		
		num1 = rando.nextInt();
		num2 = rando.nextInt();
		System.out.println(num1);
		System.out.println(num2);
		
		// Range of 1000 numbers
		num1 = rando.nextInt(150) - 15;
		num2 = rando.nextInt(150) - 15;
		System.out.println("\n" + num1);
		System.out.println(num2);
		
		// Ask the user for the sum
		System.out.print("\nWhat is " + num1 + " + " + num2 + "? ");
		sum = typetype.nextInt();		
		
		// Close Scanner
		typetype.close();
		
		// Determine if the user is correct
		if(sum == num1 + num2)
		{
			System.out.println("\nYou're a goddamn genius! That's right!");
		}
		else
		{
			System.out.println("\nLOL, no. That's wrong, dummy.");
		}
		
	}

}
