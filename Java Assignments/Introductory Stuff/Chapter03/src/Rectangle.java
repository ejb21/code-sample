// Eric Budd
// 17 September 2015
// This file shows how to create a class for a rectangle

public class Rectangle {
	
	// Declare variables
	private double length, width;
	
	// Constructors
	public Rectangle(){		
		length = 1.618;
		width = 1;
	}
	
	public Rectangle(double l, double w){
		length = l;
		width = w;
	}
		
	// Setters (Mutators)
	public void setLength(double l){		
		length = l;
	}
	
	public void setWidth(double w){
		width = w;
	}
	
	// Getters (Accessors)
	public double getLength(){
		return length;
	}
	
	public double getWidth(){
		return width;
	}	
	
	public double getArea(){
		return length * width;
	}
}