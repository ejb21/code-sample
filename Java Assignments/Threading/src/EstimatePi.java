//  Eric Budd
//  CIT360
//  Threading Assignment


import java.util.* ;


public class EstimatePi extends Thread
{
	Random random = new Random() ;
	static EstimatePi thread ;
	static int counter = 0 ;
	
	static int numRadii = 0 ;
	static int numThreads = 10 ;
	static int numTrials = numThreads * 100000 ;
	
	
	public EstimatePi(){}
	
	public static void main( String[] args )
	{
		for ( int i = 0 ;  i < numThreads ;  i++ )
		{
			thread = new EstimatePi() ;
			thread.start() ;
		}
	}

	public void run()
	{
		synchronized( System.out )
		{
			for ( int j = 0 ;  j < 100000 ;  j++ )
			{
				double x = random.nextDouble() ;
				double y = random.nextDouble() ;
				double r = Math.sqrt( x * x  +  y * y ) ;
				
				if ( r <= 1 ) numRadii++ ;
			}
			
			counter++ ;
			
			if ( counter == numThreads )
			{
				System.out.println( "Number of concurrent threads:  " + numThreads + "\n" ) ;
				System.out.println( "Estimated value of pi:   "  +  ( ( double )numRadii / numTrials ) * 4 ) ;
				System.out.println( "Actual value of pi:      3.141593" ) ;
			}
		}
	}
}