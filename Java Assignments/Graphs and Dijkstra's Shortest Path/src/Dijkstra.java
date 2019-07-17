import java.io.File ;
import java.io.FileNotFoundException ;
import java.io.PrintWriter ;
import java.util.Iterator;
import java.util.Scanner ;

public class Dijkstra
{
	public static void main( String[] args ) throws FileNotFoundException
	{
		WDGraph<Vertex> graph = new WDGraph<Vertex>() ;
		
		File input = new File( "map.dat" ) ;
		File output = new File( "directions.dat" ) ;
		
		Scanner in = new Scanner( input ) ;
		PrintWriter out = new PrintWriter( output ) ;
		
		int numVertices = Integer.parseInt( in.nextLine() ) ;
		
		// populating vertices
		for ( int i = 0 ;  i < numVertices ;  i++ )
		{
			String[] vertLine = in.nextLine().split( "," ) ;
			Vertex vert = new Vertex( Double.parseDouble( vertLine[1] ) , Double.parseDouble( vertLine[2] ) , vertLine[4] ) ;
			graph.addVertex( vert ) ;
		}
		
		int numEdges = Integer.parseInt( in.nextLine() ) ;
		
		// populating edges
		for ( int i = 0 ;  i < numEdges ;  i ++ )
		{
			String[] str = in.nextLine().split( " " ) ;
			
			int int0 = Integer.parseInt( str[0] ) ;
			int int1 = Integer.parseInt( str[1] ) ;
			int int2 = Integer.parseInt( str[2] ) ;
			
			graph.addEdge( graph.get( int0 ) , graph.get( int1 ) ,
						   Vertex.getDistance( graph.get( int0 ) , graph.get( int1 ) ) ) ;
			
			if ( int2 == 2 ) graph.addEdge( graph.get( int1 ) , graph.get( int0 ) ,
					   Vertex.getDistance( graph.get( int0 ) , graph.get( int1 ) ) ) ;
		}
		
		int numTrials = Integer.parseInt( in.nextLine() ) ;
		
		// running Dijkstra and printing out the path
		for ( int i = 0 ;  i < numTrials ;  i ++ )
		{
			String[] trial = in.nextLine().split( " " ) ;
			
			Vertex source = graph.get( Integer.parseInt( trial[0] ) ) ;
			Vertex destination = graph.get( Integer.parseInt( trial[1] ) ) ;
			
			Iterator<Vertex> path = graph.Dijkstra( source , destination ) ;
			
			Vertex current = source ;

			System.out.print( "From " + source.toString() + " to " + destination.toString() + ":\n" ) ;
			out.print( "From " + source.toString() + " to " + destination.toString() + ":\r\n" ) ;
			
			path.next() ;		// this is the source node and doesn't need to be printed
			
			while ( path.hasNext() )
			{
				Vertex v = path.next() ;
				System.out.print( "Travel " ) ;
				out.print( "Travel " ) ;
				
				if ( v.getLatitude() > current.getLatitude ()  &&  v.getLongitude() > current.getLongitude() )
				{
					System.out.print( "northeast " ) ;
					out.print( "northeast " ) ;
				}
				else if ( v.getLatitude() > current.getLatitude ()  &&  v.getLongitude() < current.getLongitude() )
				{
					System.out.print( "northwest " ) ;
					out.print( "northwest " ) ;
				}
				else if ( v.getLatitude() < current.getLatitude ()  &&  v.getLongitude() > current.getLongitude() )
				{
					System.out.print( "southeast " ) ;
					out.print( "southeast " ) ;
				}
				else if ( v.getLatitude() < current.getLatitude ()  &&  v.getLongitude() < current.getLongitude() )
				{
					System.out.print( "southwest " ) ;
					out.print( "southwest " ) ;
				}
				else if ( v.getLatitude() > current.getLatitude () )
				{
					System.out.print( "north " ) ;
					out.print( "north " ) ;
				}
				else if ( v.getLatitude() < current.getLatitude () )
				{
					System.out.print( "south " ) ;
					out.print( "south " ) ;
				}
				else if ( v.getLongitude() > current.getLongitude () )
				{
					System.out.print( "east " ) ;
					out.print( "east " ) ;
				}
				else if ( v.getLongitude() < current.getLongitude () )
				{
					System.out.print( "west " ) ;
					out.print( "west " ) ;
				}

				System.out.print( "to " + v.toString() + ".\n" ) ;
				out.print( "to " + v.toString() + ".\r\n" ) ;
			}

			System.out.println( "Total distance traveled: " + graph.totalDistance + " kilometers.\n" ) ;
			out.println( "Total distance traveled: " + graph.totalDistance + " kilometers.\r\n" ) ;
		}

		in.close() ;
		out.close() ;
	}
}