// Eric Budd
// 8 September 2015
// THIS program will demonstrate further use of the printf method

public class MorePrintf {

	public static void main(String[] args) {
		
		String name = "Eric";
		String lastName = "Budd";
		
		System.out.printf("My name is %s\n", name);
		System.out.printf("%-20s" + lastName + "\n", name);
		System.out.printf("%-20s%s\n\n", name, lastName);
		
		// .pdf in the Weeks 03-04 folder on the uses of printf
		
		System.out.printf("$%,.2f is the cost of living.", 6900.991234);
				
	}

}
