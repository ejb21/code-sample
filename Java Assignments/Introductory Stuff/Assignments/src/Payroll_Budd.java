// Eric Budd
// 19 October 2015
// Programming Assignment 2: Electric Boogaloo


public class Payroll_Budd {
	
	
	// Variables
	
	private int hoursWorked;
	private double payRate;
	
	
	// Constructors
	
	public Payroll_Budd(){
		hoursWorked = 40;
		payRate = 7.25;
	}
	
	public Payroll_Budd(int h, double p){
		hoursWorked = h;
		payRate = p;
	}
	
	
	// Mutators (Setters)
	
	public void setHours(int h){
		hoursWorked = h;
	}
	
	public void setWage(double p){
		payRate = p;
	}
	
	
	// Accessors (Getters)
	
	public int getHours(){
		return hoursWorked;
	}
	
	public double getWage(){
		return payRate;
	}
	
	public double getPaycheck(){
		if(hoursWorked > 40)
		{
			return (payRate * 40) + ((hoursWorked - 40) * (payRate * 1.5));
		}
		else
		{
			return payRate * hoursWorked;
		}
		
		
	}
}