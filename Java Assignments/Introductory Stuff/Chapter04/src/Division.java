// Eric Budd
// 29 September 2015
// This program will accept two numbers and divide them

import java.util.Scanner;

public class Division {

	public static void main(String[] args) {
		
		// Declare variables and objects
		int num1, num2;
		Scanner typetype = new Scanner(System.in);
		
		// Get input from user
		System.out.print("What is the dividend? ");
		num1 = typetype.nextInt();
		System.out.print("What's the divisor? ");
		num2 = typetype.nextInt();
		
		// Perform calculations
		if(num2 == 0)
		{
			System.out.println("Quit trying to divide by zero, jerkass.");
			System.out.print("Give me a number I can fucking use: ");
			num2 = typetype.nextInt();
		}
		if(num2 == 0)
		{
			System.out.println("\nQuit trying to divide by zero, jerkass.");
			System.out.print("Give me a number I can fucking use: ");
			num2 = typetype.nextInt();
		}
		else
		{
		System.out.println("\n" + num1 + " ÷ " + num2 + " = " + (double)(num1) / num2);
		}
		
		// Close Scanner object
		typetype.close();
		
	}

}
