// Eric Budd
// 3 September 2015
// This program will demonstrate use of the printf method

public class PrintFormatter {

	public static void main(String[] args) {
		
		// Declare variables
		String name = "Eric Budd";
		int age = 22;
		double wage = 75.23;
		
		// Print variables using println
		System.out.println("My name is: " + name);
		System.out.println("My age is: " + age);
		System.out.println("My wage is: $" + wage);
		System.out.println("My name is " + name + ", my age is " + age + ", and my wage is $" + wage +".");
		
		// Print variables using printf
		System.out.printf("\nMy name is %s", name);
		System.out.printf("\nMy age is %d", age);
		System.out.printf("\nMy wage is $%f", wage);
		System.out.printf("\nMy name is %s, my age is %d, and my wage is $%f", name, age, wage);
		
	}

}
