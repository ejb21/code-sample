// Eric Budd
// 29 October 2015
// This program will demonstrate how to use the increment and decrement operators

public class IncDec {

	public static void main(String[] args) {
		
		int number = 5;

		System.out.println(number);
		number ++;
		System.out.println(number);
		number --;
		System.out.println(number);
		System.out.println("");

		System.out.println(number);
		++ number;
		System.out.println(number);
		-- number;
		System.out.println(number);
		System.out.println("");

		System.out.println(number);
		System.out.println(number++);			// prints 5, adds to 6
		System.out.println(number);				// prints 6
		
		System.out.println(++number);			// prints 7
		
	}

}