// Eric Budd
// 5 November 2015
// Programming assignment #3

public class Budd_MonthDays {
	
	
	// Variable declaration
	
	private int month, year, numDays;
	
	
	
	// Default constructor
	
	public Budd_MonthDays() {
		month = 0;
		year = 0;
	}
	
	
	
	// Month and year mutators
	
	public void setMonth(int m) {
		month = m;
	}
	
	public void setYear(int y) {
		year = y;
	}
		
	
	
	// Number of days accessor
	
	public int getNumberOfDays() {
		
		switch (month)
		{
		case 1:
			numDays = 31;
			break;
			
		case 2:
			if (year % 100 == 0)
			{
				if (year % 400 == 0)
				{
					numDays = 29;
					break;
				}
				else
				{
					numDays = 28;
					break;
				}
			}
			else if (year % 4 == 0)
			{
				numDays = 29;
				break;
			}
			else
			{
				numDays = 28;
				break;
			}
			
		case 3:
			numDays = 31;
			break;
		case 4:
			numDays = 30;
			break;
		case 5:
			numDays = 31;
			break;
		case 6:
			numDays = 30;
			break;
		case 7:
			numDays = 31;
			break;
		case 8:
			numDays = 31;
			break;
		case 9:
			numDays = 30;
			break;
		case 10:
			numDays = 31;
			break;
		case 11:
			numDays = 30;
			break;
		case 12:
			numDays = 31;
			break;
		}
		
		return numDays;
		
	}	
	
}
