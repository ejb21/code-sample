// Eric Budd
// 3 November 2015
// This program will average some test scores using a do-while loop

import java.util.Scanner;

public class TestAverage2 {

	public static void main(String[] args) {
		
		Scanner typetype = new Scanner(System.in);
		
		int groupScore, counter = 0;
		String yesNo;
		char repeat;
		
		do
		{
			groupScore = 0;
			
			int memberCounter = 1;
			
			while(memberCounter <= 4)
			{
				System.out.print("Member " + memberCounter + " score: ");
				groupScore += typetype.nextInt();
				memberCounter ++;
			}
			
			typetype.nextLine();
			
			counter ++;
			
			System.out.println("\nThe average for Group " + counter + " is " + (groupScore / 4) + "%.");
			
			System.out.print("Would you like to go again? ");
			yesNo = typetype.nextLine();
			System.out.print("\n");
		}
		while(yesNo.equalsIgnoreCase("yes") || yesNo.equalsIgnoreCase("y"));
		
		typetype.close();
		
	}

}