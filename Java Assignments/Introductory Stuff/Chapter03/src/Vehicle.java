// Eric Budd
// 22 September 2015
// This class will allow objects of a vehicle to be created

public class Vehicle {
	
	// Declare fields
	private String owner, make, model, color;
	private int year;
	
	// Constructors
	// Default constructor — initialize all fields
	Vehicle(){
		owner = "";
		make = "";
		model = "";
		color = "";
		year = 0;
	}
	
	Vehicle(String o, String ma, String mo, String c, int y){
		owner = o;
		make = ma;
		model = mo;
		color = c;
		year = y;
	}
	
	// Setters / Mutators
	public void setOwner(String o){
		owner = o;
	}
	
	public void setMake(String m){
		make = m;
	}
	
	public void setModel(String m){
		model = m;
	}
	
	public void setColor(String c){
		color = c;
	}
	
	public void setYear(int y){
		year = y;
	}
	
	
	// Getters / Accessors
	public String getOwner(){
		return owner;
	}
	
	public String getMake(){
		return make;
	}
	
	public String getModel(){
		return model;
	}
	
	public String getColor(){
		return color;
	}
	
	public int getYear(){
		return year;
	}
	
	public String getSpecs(){
		String info = "\n\n" + owner + "\'s Vehicle\n";
		info += "——————————————————————————————————\n";
		info += "  Make:\t\t" + make + "\n";
		info += "  Model:\t" + model + "\n";
		info += "  Color:\t" + color + "\n";
		info += "  Year:\t\t" + year + "\n";
		return info;
	}

}




















