// Eric Budd
// 10 November 2015
// This program will check to see if a file exists and read it if it does

import java.io.*;
import java.util.Scanner;

public class CheckFile {

	public static void main(String[] args) throws FileNotFoundException {
		
		String fileName;
		Scanner typetype = new Scanner(System.in);
		
		System.out.print("What is the name of your file? ");
		fileName = typetype.nextLine();
		File newFile = new File(fileName);
		
		if(newFile.exists())
		{
			System.out.println("\nHere are the contents of " + fileName + ":\n");
			
			// Start reading from file using Scanner class
			Scanner inputFile = new Scanner(newFile);
			
			//Loop through file contents
			while(inputFile.hasNext())
			{
				System.out.println(inputFile.nextLine());
			}
			
			inputFile.close();
		}
		else
		{
			System.out.println(fileName + " does not exist.");
		}
				
		typetype.close();
		
	}

}