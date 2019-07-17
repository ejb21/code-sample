// Eric Budd
// 24 September 2015
// This program will demonstrate how to use IF statements

import java.util.Scanner;

public class IfStatements {

	public static void main(String[] args) {
		
		// Declare variables
		double test1 = 96.7,
			   test2 = 54.3,
			   test3 = 84.4,
			   average;
		int    age;
		Scanner typetype = new Scanner(System.in);
		
		// Determine average test score
		average = (test1 + test2 + test3) / 3;
		
		// Determine awesomeness
		if(average >= 75)
		{
			System.out.println("You are awesome!");
		}
		
		else
		{
			System.out.println("Fuck you.");
		}
		
		// Ask user for their age
		System.out.print("What is your age? ");
		age = typetype.nextInt();
		
		if(age > 20)
		{
			System.out.println("Let's get a drink!");
		}
		
		if(age >= 21)
		{
			System.out.println("Let\'s party!");
			if(age >=25)
			{
				System.out.println("Let\'s rent a car and drive to Tijuana!");
			}
		}
		else
		{
			System.out.println("You should stay home and study.");
		}
		
		// Close scanner
		typetype.close();

	}

}
