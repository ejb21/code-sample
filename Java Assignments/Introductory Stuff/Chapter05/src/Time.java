// Eric Budd
// 3 November 2015
// This program will display every second, minute, and hour

import java.text.DecimalFormat;

public class Time {

	public static void main(String[] args) {
		
		DecimalFormat myFormatter = new DecimalFormat("00");
		
		for(int h = 0; h < 12; h ++){
			for(int m = 0; m < 60; m ++){
				for(int s = 0; s < 60; s ++)
				{
					System.out.print(myFormatter.format(h) + ":");
					System.out.print(myFormatter.format(m) + ":");
					System.out.println(myFormatter.format(s));
				}
			}
		}
		
		
		
		
		/*
		for(int h = 0; h < 12; h ++)
		{
			System.out.print(h);
			for(int m = 0; m < 60; m ++)
			{
				System.out.print(h + ":" + m);
				for(int s = 0; s < 60; s ++)
				{
					System.out.println(h + ":" + m + ":" + s);
				}
			}
		}
		*/
		
	}

}
