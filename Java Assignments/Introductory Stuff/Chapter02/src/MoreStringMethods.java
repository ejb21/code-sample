// Eric Budd
// 1 September 2015
// This program will examine some methods of the String class

public class MoreStringMethods {

	public static void main(String[] args) {
		
		String mailingAddress = "Williamsport, PA 17740";
		String city, state, zip;
		
		
		// Get City
		
		int beginIndex = 0,
			endIndex = mailingAddress.indexOf(",");
		
		System.out.println(endIndex);
		
		System.out.println(mailingAddress.substring(beginIndex, endIndex));
		System.out.println(mailingAddress.substring(0, mailingAddress.indexOf(",")));
		
		city = mailingAddress.substring(beginIndex, endIndex);
		
		
		// Get State
		
		beginIndex = endIndex + 2;
		endIndex += 4;
		
		System.out.println(mailingAddress.substring(beginIndex, endIndex));
		
		state = mailingAddress.substring(beginIndex, endIndex);
		
		
		// Get ZIP
		
		beginIndex = endIndex + 1;
		
		System.out.println(mailingAddress.substring(beginIndex));
		
		zip = mailingAddress.substring(beginIndex);
		
		
		// Print results
		
		System.out.println(city + ", " + state + " " + zip);
		
	}

}
