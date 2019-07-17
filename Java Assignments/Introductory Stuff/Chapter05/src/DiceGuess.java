// Eric Budd
// 29 October 2015
// This program will loop through asking the user to guess a random number

import java.util.Scanner;
import java.util.Random;

public class DiceGuess {

	public static void main(String[] args) {
		
		Scanner typetype = new Scanner(System.in);
		Random rando = new Random();
		int number = rando.nextInt(20) + 1;
		int guess = 0;
		int counter = 1;
		
		System.out.print("Guess the dice roll: ");
		guess = typetype.nextInt();
		
		while(guess != rando.nextInt(20) + 1)
		{
			System.out.print("Guess again: ");
			guess = typetype.nextInt();
			counter ++;
			number = rando.nextInt(20) + 1;
		}
		
		if(counter < 6)
		{
			System.out.println("That is correct. It took you " + counter + " tries.");
		}
		else
		{
			System.out.println("That is correct. It only took you " + counter + " tries.");			
		}
	}

}