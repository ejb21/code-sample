public class Point
{
	private int row ;
	private int column ;
	
	public Point( int row , int col )
	{
		this.row = row ;
		this.column = col ;
	}
	
	public void set( int row , int col )
	{
		this.row = row ;
		this.column = col ;
	}
	
	public void setRow( int row )
	{
		this.row = row ;
	}
	
	public void setColumn( int col )
	{
		this.column = col ;
	}
	
	public int getRow()
	{
		return row ;
	}
	
	public int getColumn()
	{
		return column ;
	}
}
