public class Vertex
{
	private double latitude ;
	private double longitude ;
	private String location ;
	
	public Vertex( double latitude , double longitude , String location )
	{
		this.longitude = longitude ;
		this.latitude = latitude ;
		this.location = location ;
	}
	
	public double getLongitude()
	{
		return longitude ;
	}
	
	public double getLatitude()
	{
		return latitude ;
	}
	
	public String toString()
	{
		return location ;
	}
	
	public static double getDistance( Vertex v1 , Vertex v2 )
	{
		double earthRadius = 6371 ;
		
		double lat1 = v1.getLatitude() ;
		double long1 = v1.getLongitude() ;
		double lat2 = v2.getLatitude() ;
		double long2 = v2.getLongitude() ;
		
		double dLat = toRadians( lat2 - lat1 ) ;
		double dLong = toRadians( long2 - long1 ) ;
		
		lat1 = toRadians( lat1 ) ;
		lat2 = toRadians( lat2 ) ;
		
		double a = Math.sin( dLat / 2 ) * Math.sin( dLat / 2 ) + Math.sin( dLong / 2 ) * Math.sin( dLong / 2 )
						* Math.cos( lat1 ) * Math.cos( lat2 ) ;
		
		double c = 2 * Math.atan2( Math.sqrt( a ) , Math.sqrt( 1 - a ) ) ;
		
		return earthRadius * c ;
	}
	
	private static double toRadians( double degrees )
	{
		return degrees * Math.PI / 180 ;
	}
}