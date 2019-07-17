// Eric Budd
// 3 September 2015
// This program will demonstrate type casting, constants, and printf

public class TypeCasting {

	public static void main(String[] args) {
		
		// Declare variables
		final double TAX_RATE = 1.06;
		int cash = 250;
		double dressShirt = 65.99;
		int numShirts;
		
		// Perform calculations and cast from double to int
		numShirts = (int)(cash / (dressShirt * TAX_RATE));
		System.out.println(numShirts);
		
	}

}
