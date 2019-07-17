//  Eric Budd
//  CIT360
//  Assignment 03 – Mazes






/*	******

		IN ORDER FOR THIS PROGRAM TO COMPILE,
		
		you must right-click on UnicodeMaze.java within the Package Explorer window,
		select "Properties", and under "Text File Encoding" select "Other" > "UTF-8".
		
		This file will produce much cleaner, easier-to-understand output than Maze.java.
		
		Thank you very much!

*/







public class UnicodeMaze
{
	public static void main( String[] args )
	{
		int size = ( int )( Math.random() * 25 + 25 ) ;
		
		char[][] maze = new char[size][size] ;
		boolean[][] visited = new boolean[size][size] ;
		
		char[][] mazeQueue = new char[size][size] ;
		boolean[][] visitedQueue = new boolean[size][size] ;
		int[][] mazeDist = new int[size][size] ;
		
		for ( int y = 0 ;  y < size ;  y++ )
		{
			for ( int x = 0 ;  x < size ;  x++ )
			{
				if ( y == 0  ||  x == 0 )
				{
					maze[y][x] = '■' ;
					visited[y][x] = true ;
				}
				else if ( y == size - 1  ||  x == size - 1 )
				{
					maze[y][x] = '■' ;
					visited[y][x] = true ;
				}
				else
				{
					maze[y][x] = ' ' ;
				}
			}
		}
		
		int numWalls = ( int )( Math.random() * 5 + 15 ) ;
		int randomRow = 1 , randomCol = 1 ;
		
		for ( int i = 0 ;  i < numWalls ;  i++ )
		{
			randomRow = ( int )( Math.random() * size ) ;
			randomCol = ( int )( Math.random() * size ) ;
			
			while ( visited[randomRow][randomCol] == true )
			{
				randomRow = ( int )( Math.random() * size ) ;
				randomCol = ( int )( Math.random() * size ) ;
			}

			maze[randomRow][randomCol] = '■' ;
			visited[randomRow][randomCol] = true ;
			
			int wallLength = ( int )( Math.random() * 5 ) ;
			
			for ( int j = 0 ;  j < wallLength ;  j++ )
			{
				double rand = Math.random() ;
				
				if ( rand < 0.25  &&  randomRow > 3 )
				{
					maze[--randomRow][randomCol] = '■' ;
					visited[randomRow][randomCol] = true ;
					maze[--randomRow][randomCol] = '■' ;
					visited[randomRow][randomCol] = true ;
					maze[--randomRow][randomCol] = '■' ;
					visited[randomRow][randomCol] = true ;
					maze[--randomRow][randomCol] = '■' ;
					visited[randomRow][randomCol] = true ;
					continue ;
				}
				else if ( rand < 0.5  &&  randomCol > 3 )
				{
					maze[randomRow][--randomCol] = '■' ;
					visited[randomRow][randomCol] = true ;
					maze[randomRow][--randomCol] = '■' ;
					visited[randomRow][randomCol] = true ;
					maze[randomRow][--randomCol] = '■' ;
					visited[randomRow][randomCol] = true ;
					maze[randomRow][--randomCol] = '■' ;
					visited[randomRow][randomCol] = true ;
					continue ;
				}
				else if ( rand < 0.75  &&  randomRow < size - 4 )
				{
					maze[++randomRow][randomCol] = '■' ;
					visited[randomRow][randomCol] = true ;
					maze[++randomRow][randomCol] = '■' ;
					visited[randomRow][randomCol] = true ;
					maze[++randomRow][randomCol] = '■' ;
					visited[randomRow][randomCol] = true ;
					maze[++randomRow][randomCol] = '■' ;
					visited[randomRow][randomCol] = true ;
					continue ;
				}
				else if ( randomCol < size - 4 )
				{
					maze[randomRow][++randomCol] = '■' ;
					visited[randomRow][randomCol] = true ;
					maze[randomRow][++randomCol] = '■' ;
					visited[randomRow][randomCol] = true ;
					maze[randomRow][++randomCol] = '■' ;
					visited[randomRow][randomCol] = true ;
					maze[randomRow][++randomCol] = '■' ;
					visited[randomRow][randomCol] = true ;
					continue ;
				}
			}
		}

		randomRow = ( int )( Math.random() * size ) ;
		randomCol = ( int )( Math.random() * size ) ;
		
		while ( visited[randomRow][randomCol] == true )
		{
			randomRow = ( int )( Math.random() * size ) ;
			randomCol = ( int )( Math.random() * size ) ;
		}
		
		maze[randomRow][randomCol] = 'S' ;
		visited[randomRow][randomCol] = true ;
		
		int startRow = randomRow ;
		int startCol = randomCol ;
		
		Point currPt = new Point( randomRow , randomCol ) ;
		
		SimpleStack< Point > stack = new SimpleStack< Point >() ;
		stack.push( new Point( currPt.getRow() , currPt.getColumn() ) ) ;
		
		SimpleQueue< PointQueue > queue = new SimpleQueue< PointQueue >() ;
		queue.enqueue( new PointQueue( currPt.getRow() , currPt.getColumn() , 0 ) ) ;
		
		int currRow , currCol ;

		randomRow = ( int )( Math.random() * size ) ;
		randomCol = ( int )( Math.random() * size ) ;
		
		while ( visited[randomRow][randomCol] == true )
		{
			randomRow = ( int )( Math.random() * size ) ;
			randomCol = ( int )( Math.random() * size ) ;
		}
		
		maze[randomRow][randomCol] = 'F' ;

		int finalRow = randomRow ;
		int finalCol = randomCol ;
		
		boolean isFound = false ;
		
		int stackCounter = 0 ;
		int queueCounter = 0 ;
		
		for ( int a = 0 ;  a < size ;  a++ )
		{
			for ( int b = 0 ;  b < size ;  b++ )
			{
				mazeQueue[a][b] = maze[a][b] ;
				visitedQueue[a][b] = visited[a][b] ;
			}
		}
		
		
		
		while( !stack.isEmpty() )
		{
			currRow = stack.top().getRow() ;
			currCol = stack.top().getColumn() ;

			if ( currRow == finalRow  &&  currCol == finalCol ) 
			{
				isFound = true ;
				break ;
			}

			if ( !visited[currRow - 1][currCol] )
			{
				if ( maze[currRow][currCol] != 'S' ) maze[currRow][currCol] = '↑' ;
				visited[currRow - 1][currCol] = true ;
				
				currPt.setRow( currRow - 1 ) ;
				stack.push( new Point( currPt.getRow() , currPt.getColumn() ) ) ;
				stackCounter++ ;
				continue ;
			}
			if ( !visited[currRow][currCol + 1] )
			{
				if ( maze[currRow][currCol] != 'S' ) maze[currRow][currCol] = '→' ;
				visited[currRow][currCol + 1] = true ;
				
				currPt.setColumn( currCol + 1 ) ;
				stack.push( new Point( currPt.getRow() , currPt.getColumn() ) ) ;
				stackCounter++ ;
				continue ;
			}
			if ( !visited[currRow + 1][currCol] )
			{
				if ( maze[currRow][currCol] != 'S' ) maze[currRow][currCol] = '↓' ;
				visited[currRow + 1][currCol] = true ;
				
				currPt.setRow( currRow + 1 ) ;
				stack.push( new Point( currPt.getRow() , currPt.getColumn() ) ) ;
				stackCounter++ ;
				continue ;
			}
			if ( !visited[currRow][currCol - 1] )
			{
				if ( maze[currRow][currCol] != 'S' ) maze[currRow][currCol] = '←' ;
				visited[currRow][currCol - 1] = true ;
				
				currPt.setColumn( currCol - 1 ) ;
				stack.push( new Point( currPt.getRow() , currPt.getColumn() ) ) ;
				stackCounter++ ;
				continue ;
			}

			if ( maze[currRow][currCol] != 'S' ) maze[currRow][currCol] = ' ' ;
			stackCounter-- ;
			currPt = stack.pop() ;
		}
		
		

		currRow = queue.first().getRow() ;
		currCol = queue.first().getColumn() ;
		int currDist = queue.first().getDistance() ;
		
		SimpleQueue< PointQueue > write = new SimpleQueue< PointQueue >() ;
		
		while( !queue.isEmpty() )
		{
			currRow = queue.first().getRow() ;
			currCol = queue.first().getColumn() ;
			currDist = queue.first().getDistance() ;
			
			if ( currRow == finalRow  &&  currCol == finalCol ) 
			{
				isFound = true ;
				queueCounter = currDist ;
				break ;
			}
			
			queue.dequeue() ;

			if ( !visitedQueue[currRow][currCol + 1] )
			{
				queue.enqueue( new PointQueue( currRow , currCol + 1 , currDist + 1 ) ) ;
				write.enqueue( new PointQueue( currRow , currCol + 1 , currDist + 1 ) ) ;
				visitedQueue[currRow][currCol + 1] = true ;
				mazeDist[currRow][currCol + 1] = currDist + 1 ;
			}
			if ( !visitedQueue[currRow + 1][currCol] )
			{
				queue.enqueue( new PointQueue( currRow + 1 , currCol , currDist + 1 ) ) ;
				write.enqueue( new PointQueue( currRow + 1 , currCol , currDist + 1 ) ) ;
				visitedQueue[currRow + 1][currCol] = true ;
				mazeDist[currRow + 1][currCol] = currDist + 1 ;
			}
			if ( !visitedQueue[currRow][currCol - 1] )
			{
				queue.enqueue( new PointQueue( currRow , currCol - 1 , currDist + 1 ) ) ;
				write.enqueue( new PointQueue( currRow , currCol - 1 , currDist + 1 ) ) ;
				visitedQueue[currRow][currCol - 1] = true ;
				mazeDist[currRow][currCol - 1] = currDist + 1 ;
			}
			if ( !visitedQueue[currRow - 1][currCol] )
			{
				queue.enqueue( new PointQueue( currRow - 1 , currCol , currDist + 1 ) ) ;
				write.enqueue( new PointQueue( currRow - 1 , currCol , currDist + 1 ) ) ;
				visitedQueue[currRow - 1][currCol] = true ;
				mazeDist[currRow - 1][currCol] = currDist + 1 ;
			}
		}
		
		
		currDist-- ;
		
		while ( currDist != 0 )
		{
			if ( currRow == startRow  &&  currCol == startCol ) break ;
			
			if ( mazeDist[currRow - 1][currCol] == currDist )
			{
				if ( mazeQueue[currRow - 1][currCol] != 'S' ) mazeQueue[--currRow][currCol] = '↓' ;
				currDist-- ;
			}
			else if ( mazeDist[currRow][currCol + 1] == currDist )
			{
				if ( mazeDist[currRow][currCol + 1] != 'S' ) mazeQueue[currRow][++currCol] = '←' ;
				currDist-- ;
			}
			else if ( mazeDist[currRow + 1][currCol] == currDist )
			{
				if ( mazeDist[currRow + 1][currCol] != 'S' ) mazeQueue[++currRow][currCol] = '↑' ;
				currDist-- ;
			}
			else if ( mazeDist[currRow][currCol - 1] == currDist )
			{
				if ( mazeDist[currRow][currCol - 1] != 'S' ) mazeQueue[currRow][--currCol] = '→' ;
				currDist-- ;
			}
		}
		

		System.out.println() ;
		System.out.println( "STACK IMPLEMENTATION:\n" ) ;
		
		for ( int y = 0 ;  y < size ;  y++ )
		{
			for ( int x = 0 ;  x < size ;  x++ )
			{
				System.out.print( maze[y][x] ) ;
				System.out.print( ' ' ) ;
			}
			
			System.out.println() ;
		}

		System.out.println() ;
		System.out.println() ;

		System.out.println( "QUEUE IMPLEMENTATION:\n" ) ;
		
		for ( int y = 0 ;  y < size ;  y++ )
		{
			for ( int x = 0 ;  x < size ;  x++ )
			{
				System.out.print( mazeQueue[y][x] ) ;
				System.out.print( ' ' ) ;
			}
			
			System.out.println() ;
		}

		System.out.println() ;
		System.out.println() ;
		
		if ( !isFound ) System.out.println( "The final point cannot be reached from this starting position." );
		else
		{
			System.out.println( "The stack implementation found the final point after " + stackCounter + " steps.") ;
			System.out.println( "The queue implementation found the final point after " + queueCounter + " steps.") ;
			System.out.println() ;
			System.out.println( "The queue implementation represents the optimal path." ) ;
		}
	}
}