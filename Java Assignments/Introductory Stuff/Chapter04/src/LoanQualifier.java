// Eric Budd
// 29 September 2015
// Something something loan qualifying

import java.util.Scanner;

public class LoanQualifier {

	public static void main(String[] args) {

		// Declare variables and objects
		int age, creditScore;
		double annualIncome;
		Scanner typetype = new Scanner(System.in);
		
		// Get user input
		System.out.print("What is your age? ");
		age = typetype.nextInt();
		System.out.print("What is your credit score? ");
		creditScore = typetype.nextInt();
		System.out.print("What is your annual income? ");
		annualIncome = typetype.nextDouble();
		
		// Determine if they qualify for a loan
		if(age >= 25)
		{
			if(creditScore >= 700)
			{
				if(annualIncome >= 35000)
				{
					System.out.println("Congratulations! We'll happily take your money.");
				}
				else
				{
					System.out.println("You're too damn poor. Fuck off.");
				}
			}
			else
			{
				System.out.println("Fix your fucking credit score, asshole.");
			}
		}
		else
		{
			if(creditScore >= 550 && annualIncome >= 15000)
				System.out.println("You qualify!");
			else
				System.out.println("Go fuck yourself");
		}
		
		// Close Scanner object
		typetype.close();

	}

}
