// Eric Budd
// 19 November 2015
// This program will average grades found in a text file.

import java.io.*;
import java.util.Scanner;

public class CalcScores {

	public static void main(String[] args) throws FileNotFoundException {
		
		// Declare variables, objects
		String fileName;
		Scanner typetype = new Scanner(System.in);
		
		// Ask user for the file name
		System.out.print("What is the name of your file? ");
		fileName = typetype.nextLine();
		
		// Check to see if extension was typed
		if(!fileName.contains("."))
			fileName += ".txt";
		
		// Create File and Scanner objects
		File scoresFile = new File(fileName);
		Scanner scanscan = new Scanner(scoresFile);
		
		// Declare variables for file looping
		int counter = 0;
		double runningTotal = 0;
		
		// Loop through file and add numbers
		while(scanscan.hasNextDouble())
		{
			runningTotal += scanscan.nextDouble();
			counter ++;
		}
		
		// Display output to user
		System.out.println("The average of your " + counter + " scores is " + (runningTotal / counter) + ".");
		
	}

}
