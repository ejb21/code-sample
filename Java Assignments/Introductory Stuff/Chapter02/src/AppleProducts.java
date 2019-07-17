// Eric Budd
// 8 September 2015
// This program will use the Scanner class and the printf method.

import java.util.Scanner;

public class AppleProducts {

	public static void main(String[] args) {
		
		// Declare variables and objects
		double   phonePrice, tvPrice, watchPrice;
		int      numPhones, numTVs, numWatches;
		Scanner  keyScan = new Scanner(System.in);
		
		// Get input from user
		System.out.print("What is the price of a phone? $");
		phonePrice = keyScan.nextDouble();
		System.out.print("How many phones do you want? ");
		numPhones = keyScan.nextInt();
		
		System.out.print("What is the price of a TV? $");
		tvPrice = keyScan.nextDouble();
		System.out.print("How many TVs do you want? ");
		numTVs = keyScan.nextInt();
		
		System.out.print("What is the price of a watch? $");
		watchPrice = keyScan.nextDouble();
		System.out.print("How many watches do you want? ");
		numWatches = keyScan.nextInt();
		
		System.out.printf("\n—————————————————————————————————\n%-12s%-12s%12s", "Product", "Quantity", "Price" + "\n—————————————————————————————————\n");
		System.out.printf("%-12s%-12d$%-,12.2f", "Phone", numPhones, (phonePrice * numPhones));
		System.out.printf("\n%-12s%-12d$%-,12.2f", "TV", numTVs, (tvPrice * numTVs));
		System.out.printf("\n%-12s%-12d$%-,12.2f", "Watch", numWatches, (watchPrice * numWatches));
		
		
		
		// Close Scanner
		keyScan.close();
		
	}

}
