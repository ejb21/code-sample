// Eric Budd
// 27 October 2015
// This program demonstrates use of the conditional operator

import java.util.Scanner;

public class ConditionalOperator {

	public static void main(String[] args) {
		
		// Declare objects and variables
		int grade;
		Scanner typetype = new Scanner(System.in);
		
		// Get user input
		System.out.print("What is your grade? ");
		grade = typetype.nextInt();
		
		if(grade >= 70)
			System.out.println("You passed!");
		else
			System.out.println("Failure");
		
		// Use the conditional operator to perform the same logic as above
		String output;		
		output = grade >= 70 ? "You passed!" : "Failure";
		System.out.println(output);

		System.out.println(grade >= 70 ? "You passed!" : "Failure");
		
		// Close Scanner object
		typetype.close();
		
	}

}
