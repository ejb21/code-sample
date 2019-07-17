// Eric Budd
// 3 December 2015
// Programming Assignment 04



import java.io.* ;
import java.util.Scanner ;
import java.text.DecimalFormat;


public class Budd_ProgrammingAssignment04
{

	public static void main(String[] args) throws IOException
	{
		
		int		numGroceries , quant ;
		String  item ;
		double  cost , runningTotal = 0 ;
		
		Scanner typetype  =  new Scanner ( System.in ) ;
		PrintWriter printWrite  =  new PrintWriter ( "Groceries.txt" ) ;
		DecimalFormat format  =  new DecimalFormat ( "$#,##0.00" );
		
		System.out.print ( "How many groceries are you planning on buying? " ) ;
		numGroceries = typetype.nextInt();
		typetype.nextLine() ;
		System.out.println() ;
		
		printWrite.println ( "GROCERY LIST" ) ;
		printWrite.println ( "———————————————————————————————————————" ) ;
		
		for ( int x = 1 ;  x <= numGroceries ;  x ++ )
		{
			System.out.print  ( "What is item #" + x + "? " ) ;
			item  =  typetype.nextLine() ;
			
			System.out.print  ( "What quantity of " + item + " are you planning to buy? " ) ;
			quant  =  typetype.nextInt() ;
			
			System.out.print  ( "How much does " + item + " cost? " ) ;
			cost  =  typetype.nextDouble() ;
			
			typetype.nextLine() ;
			System.out.println() ;
			
			printWrite.print ( x + ". " + item + "\t" + quant ) ;
			printWrite.println ( "\t" + format.format(( cost * quant )) ) ;
			
			runningTotal  +=  cost * quant ;
		}
		
		printWrite.println ( "———————————————————————————————————————" ) ;
		printWrite.println  ( "TOTAL\t\t\t\t" + format.format( runningTotal ) ) ;
		
		typetype.close() ;
		printWrite.close() ;
		
	}
}