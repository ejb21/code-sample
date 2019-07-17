//  Eric Budd
//  25 February 2016
//  This class allows the user to pretend they're purchasing vehicles.
//  In reality, they're purchasing BuddEric_Vehicle objects to be stored in an ArrayList for a grade.


		//  I have absolutely no idea how that guy managed to include images.
		//  It's Krepshaw's fault. He never taught us JOptionPane.


import vehicle.BuddEric_Vehicle ;
import javax.swing.JOptionPane ;
import javax.swing.ImageIcon ;			//  Leaving this here as a token of my failed attempt
import java.text.DecimalFormat;			//    Please don't dock points for unnecessary code
import java.util.ArrayList;


public class BuddEricAssignment2 {
	
	public static void main(String[] args) {
		
		
		String make  = "" ;
		String model = "" ;
		String color = "" ;
		int year = 0 , options = 0 , counter = -1 ;

		String another 		  =  "Certainly!" ;
		String optionsString  =  "" ;
		int runningTotal	  =  0 ;
		
		DecimalFormat decform  =  new DecimalFormat ( "$#,###" ) ;		//  no camelCase, no problem
		
		ArrayList< BuddEric_Vehicle > list  =  new ArrayList<>() ;
		
		
				
		String[] which  =  { "Toyota" , "Bugatti" , "Exit" } ;
		String[] again  =  { "Certainly!" , "Not now" } ;
		
		String[] toyota   =  { "4Runner" , "Camry" , "Corolla" , "FJ Cruiser" , "Highlander" , "Prius" , "Yaris" } ;
		String[] bugatti  =  { "Veyron" , "Galibier" } ;
		
		String[] colors  =  { "Red" , "Orange" , "Yellow" , "Green" , "Blue" , "Indigo" ,
							  "Violet" , "Black" , "White" , "Chrome" , "Gold" } ;
		
		String[] years  =  { "2008" , "2009" , "2010" , "2011" , "2012" , "2013" , "2014" , "2015" } ;
		
		String[] bugattiOptions  =  { "$1.4 million" } ;
		
		String[] toyotaOptions  =  { "$19,000" , "$20,000" , "$22,000" , "$24,000" , "$25,000" , "$29,000" , "$32,000" } ;
				
											//  I have no idea what it's like to buy a car.

		
		
		while ( another.equals ( "Certainly!" ) ) {			//  not indenting due to the nature of this thing
		
		counter ++ ;
		
		
		make = which[ JOptionPane.showOptionDialog
			   ( null , "Welcome to BuddEric_Vehicles, your go-to Toyota and Bugatti retailer. Which will it be?" ,
			     "BuddEric_Vehicles" , JOptionPane.YES_NO_CANCEL_OPTION , JOptionPane.QUESTION_MESSAGE , null ,
			     which , which[2] ) ] ;
		
		
		
		if ( make.equals( "Toyota" ) )
		{
			model = ( String ) JOptionPane.showInputDialog
					( null , "Please select a model." , "BuddEric_Vehicles" , JOptionPane.QUESTION_MESSAGE , null ,
					  toyota , toyota[2] ) ;
		}
		
		else if ( make.equals( "Bugatti" ) )
		{
			model = ( String ) JOptionPane.showInputDialog
					( null , "Please select a model." , "BuddEric_Vehicles" , JOptionPane.QUESTION_MESSAGE , null ,
					  bugatti , bugatti[0] ) ;
		}
		
								//  Just assigning stuff with JOptionPane. Also Googling how to use JOptionPane
		
		color  =  ( String ) JOptionPane.showInputDialog
				  ( null , "Choose your color." , "BuddEric_Vehicles" , JOptionPane.QUESTION_MESSAGE , null ,
					colors , colors[8] ) ;
		
		year  =  Integer.parseInt( ( String )( JOptionPane.showInputDialog
			     ( null , "Select the year." , "BuddEric_Vehicles" , JOptionPane.QUESTION_MESSAGE , null ,
				   years , years[0] ) ) ) ;
		
		
		
		if ( make.equals ( "Bugatti" ) )
		{
			JOptionPane.showInputDialog
			   ( null , "Choose your options. (It's a Bugatti. It has none.)" , "BuddEric_Vehicles" ,
				 JOptionPane.QUESTION_MESSAGE , null , bugattiOptions , bugattiOptions[0] ) ;
			
			options = 1400000 ;				//  Supercars make this exercise pretty simple.
		}
		
		
		else if ( make.equals ( "Toyota" ) )
		{
			optionsString = ( String ) JOptionPane.showInputDialog
			   ( null , "Choose your options." , "BuddEric_Vehicles" , JOptionPane.QUESTION_MESSAGE , null ,
				 toyotaOptions , toyotaOptions[0] ) ;
			
			optionsString = optionsString.substring ( 1 , 3 ) + optionsString.substring ( 4 , 7 ) ;
			
			options = Integer.parseInt ( optionsString ) ;
		}
		
		
		list.add ( new BuddEric_Vehicle ( make , model , color , year , options ) ) ;
		
		
		another = again[ JOptionPane.showOptionDialog
			   ( null , "That was fun. Purhcase another?" ,
			     "BuddEric_Vehicles" , JOptionPane.YES_NO_OPTION , JOptionPane.QUESTION_MESSAGE , null ,
			     again , again[0] ) ] ;
		
		
		}	// end of while loop
		
		
		
		for ( int x = 0 ;  x <= counter ;  x ++ )
		{
			System.out.println ( BuddEric_Vehicle.toString ( list.get ( x ) ) ) ;
			runningTotal += list.get( x ).getOptions() ;
		}
		
															//  Thank you for shopping at BuddEric_Vehicles
		System.out.println () ;
		System.out.println ( "Your subtotal is " + decform.format ( runningTotal ) + ". " +
							 "Will that be cash or credit?" ) ;
		
		
	}
}