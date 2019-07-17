// Eric Budd
// 5 November 2015
// This program will demonstrate the Decimal Format class

import java.text.DecimalFormat;

public class Formatter {

	public static void main(String[] args) {
		
		double money1 = 945.123,
			   money2 = 59000000,
			   money3 = .47843;
		DecimalFormat moneyFormat = new DecimalFormat("$#,##0.00");
		
		System.out.println(moneyFormat.format(money1));
		System.out.println(moneyFormat.format(money2));
		System.out.println(moneyFormat.format(money3));
		
	}

}
