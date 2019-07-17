// Eric Budd
// 5 November 2015
// This program will use a loop to write to a file

// if statements, switch statements, different looping structures for quiz Thursday
		// notecard front and back

import java.io.*;
import java.util.Scanner;

public class Friends {

	public static void main(String[] args) throws IOException {
		
		int counter = 1,
			numFriends;
		PrintWriter printWrite;
		Scanner typetype = new Scanner(System.in);
		
		System.out.print("What would you like to name the file? ");
		String fileName = typetype.nextLine();
		
		// Check for period in filename to see if there is an extension
		if(!fileName.contains("."))
			fileName += ".txt";
		
		// Check to see if file exists
		File newFile = new File(fileName);
		if(newFile.exists())
		{
			// Append to file
			FileWriter writewrite = new FileWriter(fileName, true);
			PrintWriter printWrite2 = new PrintWriter(writewrite);
			printWrite2.println("Test");
			printWrite2.close();
		}
		else
		{
			printWrite = new PrintWriter(fileName);
			
			System.out.print("How many friends do you have? ");
			numFriends = typetype.nextInt();
			typetype.nextLine();
			
			while(counter <= numFriends)
			{
				System.out.print("What is Friend #" + counter + "'s name? ");
				printWrite.println(counter + ") " + typetype.nextLine());
				counter ++;
			}
			
			printWrite.close();
		}
		
		typetype.close();
		
		System.out.println("\nDone.");
		
	}

}