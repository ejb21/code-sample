// Eric Budd
// 19 November 2015
// This program will use loops to display different patterns

public class Budd_ExtraCredit {

	public static void main(String[] args) {
		
		
		
		/*
		
		Design a program to output:
		 
		    *
		   ***
		  *****
		 *******
		*********
		 
		 
	 	And another one to output:
		 
		    *
		   ***
		  *****
		 *******
		*********
		 *******
		  *****
		   ***
		    *
		 
		... using "for" loops. Due Sunday, 11:30 p.m.
		 
		*/
		
		
		
		
		
		// PROGRAM 1
		
		
		int x, y;
		
		for (x = 4; x >= 0; x--)
		{
			for (y = 1; y <= x; y++)
				System.out.print(" ");
			
			for (y = 1; y <= (9 - (2 * x)); y++)
				System.out.print("*");
			
			for (y = 1; y <= x; y++)
				System.out.print(" ");
			
			System.out.println();
		}
		
		
		
		
		System.out.println();
		
		
		
		
		// PROGRAM 2
		
		
		for (x = 4; x >= 0; x--)
		{
			for (y = 1; y <= x; y++)
				System.out.print(" ");
			
			for (y = 1; y <= (9 - (2 * x)); y++)
				System.out.print("*");
			
			for (y = 1; y <= x; y++)
				System.out.print(" ");
			
			System.out.println();
		}
		
		for (x = 1; x <= 4; x++)
		{
			for (y = 1; y <= x; y++)
				System.out.print(" ");
			
			for (y = 1; y <= (9 - (2 * x)); y++)
				System.out.print("*");
			
			for (y = 1; y <= x; y++)
				System.out.print(" ");
			
			System.out.println();
		}
		
		
		
		
	}

}
