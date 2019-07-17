// Eric Budd
// 22 September 2015
// This program will utilize the Vehicle class

import java.util.Scanner;

public class VehicleDriver {

	public static void main(String[] args) {
		
		// Declare variables and objects
		String owner, make, model, color;
		int year;
		Scanner typetype = new Scanner(System.in);
		
		// Create object of Vehicle class by manually specifying all fields
		Vehicle lightningMcQueen = new Vehicle();
		lightningMcQueen.setOwner("Piston Cup, Inc.");
		lightningMcQueen.setMake("Pontiac");
		lightningMcQueen.setModel("Something");
		lightningMcQueen.setColor("Red");
		lightningMcQueen.setYear(2006);
		
		
		// Create object of Vehicle class by asking for user input
		// Set owner and make by first capturing user input as variables
		
		Vehicle secondVehicle = new Vehicle();
		
		System.out.print("What is your name? ");
		owner = typetype.nextLine();
		secondVehicle.setOwner(owner);
		
		System.out.print("What is the car's make? ");
		make = typetype.nextLine();
		secondVehicle.setMake(make);
		
		
		// Set model, color, and year by passing what the user types directly to the setters
		
		System.out.print("What is the model? ");
		secondVehicle.setModel(typetype.nextLine());
		
		System.out.print("What color is it? ");
		secondVehicle.setColor(typetype.nextLine());
		
		System.out.print("And the year? ");
		secondVehicle.setYear(typetype.nextInt());
		typetype.nextLine();
		
		
		// Create another object of the Vehicle class
		Vehicle thirdVehicle;
		System.out.print("\nWhat is your name? ");
		owner = typetype.nextLine();
		System.out.print("What is the car's make? ");
		make = typetype.nextLine();		
		System.out.print("What is the car's model? ");
		model = typetype.nextLine();		
		System.out.print("What's its color? ");
		color = typetype.nextLine();		
		System.out.print("What year? ");
		year = typetype.nextInt();
		thirdVehicle = new Vehicle(owner, make, model, color, year);
		System.out.println(thirdVehicle.getSpecs());
		
		
		// Print out vehicle specs
		System.out.println("\n    " + lightningMcQueen.getOwner() + "\'s Vehicle");
		System.out.println("——————————————————————————————————");
		System.out.println("  Make:\t\t" + lightningMcQueen.getMake());
		System.out.println("  Model:\t" + lightningMcQueen.getModel());
		System.out.println("  Color:\t" + lightningMcQueen.getColor());
		System.out.println("  Year:\t\t" + lightningMcQueen.getYear());
		System.out.println("  Name:\t\tLightning McQueen");
		
		System.out.print(secondVehicle.getSpecs());
		
		
		
		// Close Scanner
		typetype.close();
		
	}
}