//  Eric Budd
//  25 February 2016
//  This class allows for the creation of BuddEric_Vehicle objects containing five attributes.
//  There's also a .toString and a .equals, OBVIOUSLY


package vehicle ;
import java.text.DecimalFormat ;


public class BuddEric_Vehicle {
	
	private String make  = "" ;
	private String model = "" ;
	private String color = "" ;
	private int year , options ;
	
	
	public BuddEric_Vehicle()
	{
		make	 =  "Toyota" ;
		model	 =  "Corolla" ;				/*		Default constructor pretends as though		*/
		color	 =  "Black" ;				/*		  you bought my car for $8K. Sucker.		*/
		year	 =  2004 ;
		options	 =  8000 ;
	}
	
	public BuddEric_Vehicle ( String ma , String mo , String c , int y , int o )
	{
		make	 =  ma ;
		model	 =  mo ;
		color	 =  c ;
		year	 =  y ;
		options	 =  o ;
	}
	
	
	public void setMake ( String ma ) {				/*		I actually really like what's		 */
		make = ma ;					  }				/*		going on with the braces here.		 */
	
	public String getMake() {
		return make ;		}
	
	
	
	public void setModel ( String mo ) {
		model = mo ;				   }
	
	public String getModel() {
		return model ;		 }
	
	
	
	public void setColor ( String c ) {
		color = c ;					  }				/*		This is the setter and getter		*/
													/*		   portion of our program.			*/
	public String getColor() {
		return color ;		 }
	
	
	
	public void setYear ( int y ) {
		year = y ;				  }
	
	public int getYear() {
		return year ;	 }
	
	
	
	public void setOptions ( int o ) {
		options = o ;				 }
	
	public int getOptions() {
		return options ;	}
	
										//  equals method compares attributes of two BuddEric_Vehicles
														 //  it is a static method
	
	public static boolean equals ( BuddEric_Vehicle a , BuddEric_Vehicle b )
	{
		if ( a.make.equals( b.make )  &&  a.model.equals( b.model )  &&
			 a.color.equals( b.color )  &&  a.year == b.year  &&  a.options == b.options )
			return true ;
		else
			return false ;
	}
										   //  toString method prints on one line, contains em dash
	
	public static String toString ( BuddEric_Vehicle a )
	{
		DecimalFormat decform  =  new DecimalFormat ( "$#,###" ) ;
		return a.color + " " + a.year + " " + a.make + " " + a.model + "  —  " + decform.format ( a.options ) ;
	}
	
}