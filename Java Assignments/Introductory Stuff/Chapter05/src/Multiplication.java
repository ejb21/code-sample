// Eric Budd
// 29 October 2015
// This program will calculate a small multiplication table

import java.util.Scanner;

public class Multiplication {

	public static void main(String[] args) {
		
		Scanner typetype = new Scanner(System.in);
		int number, multiples, counter = 1;
		
		System.out.print("What number would you like to see multiples of? ");
		number = typetype.nextInt();
		
		System.out.print("How many multiples? ");
		multiples = typetype.nextInt();
		System.out.println("\n");
		
		while(counter <= multiples)
		{
			if(counter < 10)
			{
				System.out.println(number + " * " + counter + "   =  " + (number * counter));
				counter ++;
			}
			else
			{
			System.out.println(number + " * " + counter + "  =  " + (number * counter));
			counter ++;
			}
		}
		
	}

}
