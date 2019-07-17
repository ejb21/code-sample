public class PointQueue
{
	private int row ;
	private int column ;
	private int distance ;
	
	public PointQueue( int row , int col , int dist )
	{
		this.row = row ;
		this.column = col ;
		this.distance = dist ;
	}
	
	public void set( int row , int col , int dist )
	{
		this.row = row ;
		this.column = col ;
		this.distance = dist ;
	}
	
	public void setRow( int row )
	{
		this.row = row ;
	}
	
	public void setColumn( int col )
	{
		this.column = col ;
	}
	
	public void setDistance( int dist )
	{
		this.column = dist ;
	}
	
	public int getRow()
	{
		return row ;
	}
	
	public int getColumn()
	{
		return column ;
	}
	
	public int getDistance()
	{
		return distance ;
	}
}
