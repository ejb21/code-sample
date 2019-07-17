// Eric Budd
// 5 November 2015
// This program will demonstrate how to write to a file

import java.io.*;

public class WriteDemo {

	public static void main(String[] args) throws FileNotFoundException {
		
		// Declare and open file
		PrintWriter printWrite = new PrintWriter("test.txt");
		
		// Write to the file
		printWrite.println("Hello, world");
		
		// Close file
		printWrite.close();
		
		// Notify user
		System.out.println("File has been written to.");
		
	}

}
