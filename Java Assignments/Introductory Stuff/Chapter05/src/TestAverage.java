// Eric Budd
// 3 November 2015
// This program will average some test scores using a do-while loop

import java.util.Scanner;

public class TestAverage {

	public static void main(String[] args) {
		
		Scanner typetype = new Scanner(System.in);
		int testScore, total = 0, counter = 1;
		
		System.out.println("This program averages test scores.\n(Enter -1 as your grade to cancel.)\n");
		
		do
		{
			System.out.print("What was the score for test #" + counter + "? ");
			testScore = typetype.nextInt();
			total += testScore;
			counter += 1;
		}
		while(testScore != -1);
		
		total += 1;
		counter -= 2;
		
		System.out.println("\nYour grade is " + ((double)(total) / counter) + "%.");
		
		typetype.close();
		
	}

}