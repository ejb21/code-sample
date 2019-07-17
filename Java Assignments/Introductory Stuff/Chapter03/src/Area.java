// Eric Budd
// 15 September 2015
// This program will demonstrate the Math class and use various methods to perform calculations.

import java.util.Scanner;
import java.lang.Math;

public class Area {

	public static void main(String[] args) {
		
		// Declare variables and objects
		int length, width;
		double radius;
		Scanner keyboard = new Scanner(System.in);
		
		// Get user input
		System.out.print("What is the length of your rectangle? ");
		length = keyboard.nextInt();
		System.out.print("What is the width of your rectangle? ");
		width = keyboard.nextInt();
		
		// Pass variables to method
		System.out.println("\nThe area of your rectangle is " + getRectangleArea(length, width) + " units squared.");
		
		// Get user input
		System.out.print("\n\nWhat is the radius of your circle? ");
		radius = keyboard.nextDouble();
		
		// Pass variable to method
		System.out.println("\nThe area of your circle is " + getCircleArea(radius) + " units squared.");
		
		// Close Scanner object
		keyboard.close();
		
	}
	
	
	public static int getRectangleArea(int l, int w){
		
		int area;
		area = l * w;
		return area;
		
	}
	

	public static double getCircleArea(double r){
		
		double area;
		area = Math.PI * r * r;
		return area;
		
	}
	
}






