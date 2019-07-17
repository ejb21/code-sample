
public class Rectangle implements Comparable<Rectangle>
{
	private int width ;
	private int height ;
	private int area = width * height ;

	public Rectangle()
	{
		super() ;
		this.width = 0 ;
		this.height = 0 ;
	}
	
	public Rectangle( int w , int h )
	{
		super() ;
		this.width = w ;
		this.height = h ;
		this.area = w * h ;
	}
	
	public void setHeight( int h )
	{
		this.height = h ;
		this.area = this.width * this.height ;
	}
	
	public void setWidth( int w )
	{
		this.width = w ;
		this.area = this.width * this.height ;
	}
	
	public int getHeight()
	{
		return height ;
	}
	
	public int getWidth()
	{
		return width ;
	}
	
	public int getData()
	{
		return area ;
	}
	
	public int compareTo( Rectangle r )
	{
		return area - r.area ;
	}
	
	public String toString()
	{
		return "Width: " + width + "\nHeight: " + height + "\nArea: " + area + "\n" ;
	}
}
