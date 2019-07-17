// Eric Budd
// 8 September 2015
// Project 1! This script will juggle Fahrenheit/Celsius and attempt to solve problems 4 and 16 from the text.


public class Budd_ProgrammingAssignment01
{
   public static void main( String [] args )
   {
	   
	   // Part I
	   
	   // Declaring constants
	   final int freezingPt  =  32;
	   final double ratio1   =  5;
	   final double ratio2   =  9;
	   
	   // And the initial temperature Fahrenheit as int
	   int tempF = 451;
	   
	   // Calculating degrees Celsius
	   double tempC = (ratio1 / ratio2) * (tempF - freezingPt);
	   
	   // Print Celsius
	   System.out.println(tempC);
	   
	   // Back to Fahrenheit
	   tempF = (int)((tempC * (ratio2 / ratio1)) + 32);
	   
	   // Print Fahrenheit
	   System.out.println(tempF);
	   
	   
	   
	   // Part II
	   
	   // [sic]! Nice typo, Tony Gaddis.
	   
	   // Declaring constants/variables
	   final int     numberSurveyed = 15000;
	   final double  percentDrink = .18,	
			         percentCitrus = .58;
	   int           purchaseDrinks,
	                 preferCitrus;
	   
	   // http://i.imgur.com/gmMoE9u.gif
	   purchaseDrinks  =  (int)(numberSurveyed * percentDrink);
	   preferCitrus    =  (int)(purchaseDrinks * percentCitrus);
	   
	   // Print results
	   System.out.println("\nApproximately " + purchaseDrinks + " customers purchase one or more energy drinks per week.");
	   System.out.println("Approximately " + preferCitrus + " prefer citrus.");
	   
	   
	   
	   // Part III
	   
	   System.out.println("\n   *\n  ***\n *****\n*******\n *****\n  ***\n   *");
	   
   }
}