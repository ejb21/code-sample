import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Stack;

public class WDGraph<T> implements GraphADT<T>{
	
	
	private final int INITIAL_CAPACITY = 16;
	private final double INFINITY = Double.MAX_VALUE;
	private int numVertices;
	private int numEdges;
	private double[][] adjMatrix;
	private T[] vertices;
	
	
	
	public WDGraph(){
		numVertices = 0;
		numEdges = 0;
		adjMatrix = new double[INITIAL_CAPACITY][INITIAL_CAPACITY];
		for (int i = 0; i < adjMatrix.length; i++) {
			for (int j = 0; j < adjMatrix[i].length; j++) {
				adjMatrix[i][j] = INFINITY;
			}
		}
		vertices = (T[]) new Object[INITIAL_CAPACITY];
		
	}
	
	
	public String toString(){
		
		if(numVertices == 0)
			return "Graph is empty";
		String result = "";
		
		result += String.format("%5s", "");
		for (int i = 0; i < numVertices; i++)
			result += String.format("%5s", vertices[i]);
		result += "\n";
		
		for (int i = 0; i < numVertices; i++) {
			result += String.format("%5s", vertices[i]);
			
			for (int j = 0; j < numVertices; j++) {
				if(adjMatrix[i][j] == INFINITY)
					//result += String.format("%5s", "inf");
					result += String.format("%5c", '\u221e');
				else
				    result += String.format("%5d", adjMatrix[i][j]);
			}
			result += "\n";
		}
		
		
		return result;
		
	}
	
	
	
	
	
	
	public double totalDistance ;

	public int numVertices() {
		return numVertices;
	}

	public int numEdges() {   // to be written
		return numEdges;
	}

	public void addVertex(T vertex) {
		//assuming that there is enough room
		
		if(numVertices == vertices.length)
			addCapacity();
		
		
		vertices[numVertices] = vertex;
		numVertices++;
		
		
		
	}
	
	public T get( int index )
	{
		if ( index >= 0  &&  index < numVertices ) return vertices[ index ] ;
		else return null ;
	}
	
	
	
/**
 * add or update an edge
 */
	public void addEdge(T vertex1, T vertex2, double weight) {
		if(isValidVertex(vertex1)  && isValidVertex(vertex2) && vertex1 != vertex2 && weight >= 0){
			if(!this.existEdge(vertex1, vertex2))
				numEdges++;
			adjMatrix[vertexIndex(vertex1)][vertexIndex(vertex2)] = weight;
			
		}
	}

	
	
	
	
	
	private boolean isValidVertex(T vertex){
		for(int i = 0; i < numVertices; i++)
			if(vertices[i].equals(vertex))
				return true;
		return false;
	}
	
	
	
	
	
	
	
	private boolean isValidIndex(int index){
	
		return (index < numVertices && index >= 0);
	
	}
	
	
	
	/**
	 * 		
	 * @param vertex
	 * @return  the index of the vertex.  return -1 if not found
	 */
	private int vertexIndex(T vertex){
		for(int i = 0; i < numVertices; i++)
			if(vertices[i].equals(vertex))
				return i;
		return -1;
	}
	
	
	
	public void removeVertex(T vertex) {
		if(!isValidVertex(vertex))
			return;
		int index = vertexIndex(vertex);
		for(int i = index +1 ; i < numVertices; i++)
			vertices[i - 1] = vertices[i];
		
		for(int i = index; i < numVertices - 1; i++){
			for(int j = 0; j < numVertices; j++)
				adjMatrix[i][j] = adjMatrix[i+1][j];
		}
		
		for(int j = index; j < numVertices - 1; j++){
			for(int i = 0; i < numVertices; i++)
				adjMatrix[i][j] = adjMatrix[i][j+1];
		}	
		
		numVertices--;
	}
	
	
	

	public void removeEdge(T vertex1, T vertex2) {
		if(isValidVertex(vertex1)  && isValidVertex(vertex2) && vertex1 != vertex2){
			adjMatrix[vertexIndex(vertex1)][vertexIndex(vertex2)] = INFINITY;
			numEdges--;
		}
	}

	public boolean isEmpty() {
		
		return numVertices == 0;
	}
	
	
	/**
	 * Double the existing capacity
	 * 
	 */
	private void addCapacity(){
		T[] newVertices = (T[]) new Object[vertices.length * 2];
		for(int i = 0; i < numVertices; i++)
			newVertices[i] = vertices[i];
		
		double[][] newAdjMat = new double[vertices.length * 2][vertices.length * 2];
		for (int i = 0; i < newAdjMat.length; i++) {
			for (int j = 0; j < newAdjMat[i].length; j++) {
				if(i < numVertices && j<numVertices)
					newAdjMat[i][j] = adjMatrix[i][j];
				else
					newAdjMat[i][j] = INFINITY;
			}
		}
		vertices = newVertices;
		adjMatrix = newAdjMat;
		
				
	}
	
	
	
	/**
	 * returns all the neighbors of the vertex
	 * 
	 * @param vertex
	 * @return
	 */
	public Iterator<T> neighbors(T vertex){
		
		ArrayList<T> list = new ArrayList<T>();
		
		if(isValidVertex(vertex)){
			int i = vertexIndex(vertex);
			for(int j = 0; j < numVertices; j++)
				if(adjMatrix[i][j] != INFINITY)
					list.add(vertices[j]);
		}
		
		return list.iterator();
	}
	
	
	/**
	 * We are assuming that vertex2 is a neighbor of vertex1
	 * Method returns the next neighbor of vertex1 that is listed after vertex2.
	 * return null, if there is none
	 * 
	 * @param vertex1
	 * @param vertex2
	 * @return
	 */
	public T nextNeighbor(T vertex1, T vertex2){
		
		
		if(!isValidVertex(vertex1) || !isValidVertex(vertex2) || !existEdge(vertex1, vertex2))
			return null;
			
		int i = vertexIndex(vertex1);
		int k = vertexIndex(vertex2);
		
		
		for(int j = k + 1; j < numVertices; j++)
				if(adjMatrix[i][j] != INFINITY)
					return vertices[j];
		
		
		return null;
	}
	
	
	public boolean existEdge(T vertex1, T vertex2) {
		return isValidVertex(vertex1) && 
				isValidVertex(vertex2) && 
				(adjMatrix[vertexIndex(vertex1)][vertexIndex(vertex2)] != INFINITY);
	}


	/**
	 * Use the depth first Search method to visit all the vertices starting at the given vertex.
	 * return the visitation list as an Iterator
	 * 
	 */
	public Iterator<T> DFS(T vertex) {
		if(!isValidVertex(vertex))
			return null;
		
		boolean[] visited = new boolean[numVertices];
		Stack<T> stack = new Stack<T>();
		ArrayList<T> list = new ArrayList<T>();
		T top, next;
		
		visited[vertexIndex(vertex)] = true;
		stack.push(vertex);
		list.add(vertex);
		while(!stack.empty()){
			top = stack.peek();
			next = nextUnvisitedNeighbor(visited, top);
			if(next == null)
				stack.pop();
			else{
				visited[vertexIndex(next)] = true;
				list.add(next);
				stack.push(next);
			}
		}
		
		
		return list.iterator();
	}
	

	
	
	public Iterator<T> BFS(T vertex) {
		if(!isValidVertex(vertex))
			return null;
		
		boolean[] visited = new boolean[numVertices];
		LinkedList<T> queue = new LinkedList<T>();
		ArrayList<T> list = new ArrayList<T>();
		T top, next;
		Iterator<T> it;
		
		
		visited[vertexIndex(vertex)] = true;
		queue.add(vertex);
		list.add(vertex);
		while(!queue.isEmpty()){
			top = queue.remove();
			it = neighbors(top);
			while(it.hasNext()){
				next = it.next();
				if(!visited[vertexIndex(next)]){
					visited[vertexIndex(next)] = true;
					queue.add(next);
					list.add(next);
				}
			}
			
		}
		
		
		return list.iterator();
	}
	
	
	
	
	
	
	
	private T nextUnvisitedNeighbor(boolean[] visited, T vertex){
		int i = vertexIndex(vertex);
		for(int j = 0; j < numVertices; j++)
			if(adjMatrix[i][j] != INFINITY && !visited[j] )
				return vertices[j];
		
		return null;   // no unvisited neighbor or no neighbor
	}
	
	
	
	


	public int numComponents() {
		int count = 0;
		int ind, i;
		
		if(numVertices != 0){
			boolean[] visited = new boolean[numVertices];
			boolean done = false;
			Iterator<T> it;
			
			while(!done){
				ind = 0; 
				while(ind < numVertices && visited[ind])
					ind++;
				
				if( ind == numVertices)
					done = true;
				else{
						count++;  //must belong to a new component
						it = componentVrtices(vertices[ind]);
						while(it.hasNext())
							visited[vertexIndex(it.next())] = true;
					}
				
			}
		
		}
		return count;
	}

	
	
	public Iterator<T> componentVrtices(T vertex){
		if(!isValidVertex(vertex))
			return null;
		
		boolean[] visited = new boolean[numVertices];
		Stack<T> stack = new Stack<T>();
		ArrayList<T> list = new ArrayList<T>();
		list.add(vertex);
		T temp;
		int ind;
		
		visited[vertexIndex(vertex)] = true;
		stack.push(vertex);
		while(!stack.isEmpty()){
			temp = stack.pop();
			ind = vertexIndex(temp);
			for(int j = 0; j < numVertices; j++)
				if(adjMatrix[ind][j] != INFINITY && !visited[j]){
					visited[j] = true;
					stack.push(vertices[j]);
					list.add(vertices[j]);
				}
			
			for(int i = 0; i < numVertices; i++)
				if(adjMatrix[i][ind] != INFINITY && !visited[i]){
					visited[i] = true;
					stack.push(vertices[i]);
					list.add(vertices[i]);
				}
			
		}
		
		return list.iterator();
	}
	
	
	
	
	

	public boolean isConnected() {
	
		return numComponents() == 1;
	}
	
	
	/**
	 * use DFS algorithm to find a path from vertex1 to vertex2.
	 * return null if there is none.
	 * @param vertex1
	 * @param vertex2
	 * @return
	 */
	public Iterator<T> path(T vertex1, T vertex2){
		
		if(!isValidVertex(vertex1) || !isValidVertex(vertex2))
			return null;
		
		boolean[] visited = new boolean[numVertices];
		Stack<T> stack = new Stack<T>();
		ArrayList<T> list = new ArrayList<T>();
		T top, next;
		boolean done = false;
		
		visited[vertexIndex(vertex1)] = true;
		stack.push(vertex1);
		while(!stack.empty() && !done){
			top = stack.peek();
			if(top.equals(vertex2)){  //reached vertex2
				done = true;
				break;
			}
			next = nextUnvisitedNeighbor(visited, top);
			if(next == null)
				stack.pop();
			else{
				visited[vertexIndex(next)] = true;
				stack.push(next);
			}
		}
		
		if(done)
			//return list.iterator();
		  while(!stack.isEmpty())
			  list.add(0, stack.pop());
		
		return list.iterator();
		
	}
	
	
	
	
	
	
	/*
		Dijkstra method begins with a capital letter
			because "Dijkstra" is a proper noun
		
			    Dijkstra.java is the driver
	*/
	
	public Iterator<T> Dijkstra( T source , T destination )
	{
		if ( !this.isValidVertex( source ) || !this.isValidVertex( destination ) ) return null ;
		
		// two ArrayLists for Dijkstra's progression
		ArrayList<T> complete = new ArrayList<T>() ;
		ArrayList<T> incomplete = new ArrayList<T>() ;
		
		// two arrays containing distances and previous nodes for every vertex
		double[] dist = new double[numVertices] ;
		T[] prev = (T[]) new Object[numVertices] ;
		
		// variables to be used within loops
		int vIndex , nIndex , index ;
		T vertex , neighbor ;
		
		// populating the "incomplete" ArrayList and setting all distances to infinity
		for ( int i = 0 ;  i < numVertices ;  i++ )
		{
			incomplete.add( vertices[i] ) ;
			dist[i] = INFINITY ;
		}
		
		// source node has a distance of zero
		dist[ vertexIndex( source ) ] = 0 ;
		
		while ( !incomplete.isEmpty() )
		{
			index = Integer.MAX_VALUE ;
			
			// finding the smallest distance among the vertices within the "incomplete" ArrayList
			for ( int i = 0 ;  i < incomplete.size() ;  i++ )
				if ( dist[ vertexIndex( incomplete.get( i ) ) ] < index ) index = i ;
			
			if ( index == Integer.MAX_VALUE ) vertex = incomplete.get( 0 ) ;	// only fires for final "incomplete" node
			else vertex = incomplete.get( index ) ;								// all others pass through to else clause
			
			vIndex = vertexIndex( vertex ) ;
			
			Iterator<T> neighbors = neighbors( vertex ) ;
			
			// cycling through all of the current vertex's neighbors
			while( neighbors.hasNext() )
			{
				neighbor = neighbors.next() ;
				nIndex = vertexIndex( neighbor ) ;
				
				// if a new shortest path to a neighbor found, register it within the distance and previous node arrays
				if ( adjMatrix[ vIndex ][ nIndex ] + dist[ vIndex ] < dist[ nIndex ] )
				{
					dist[ nIndex ] = adjMatrix[ vIndex ][ nIndex ] + dist[ vIndex ] ;
					prev[ nIndex ] = vertex ;
				}
			}
			
			// move vertex to the "completed" ArrayList
			complete.add( vertex ) ;
			incomplete.remove( vertex ) ;
		}
		
		// new ArrayList contains the optimal path from source to destination
		ArrayList<T> path = new ArrayList<T>() ;
		T temp = destination ;
		path.add( temp ) ;
		totalDistance = dist[ vertexIndex( temp ) ] ;
		
		// walk it back and populate the ArrayList
		while ( prev[ vertexIndex( temp ) ] != null )
		{
			temp = prev[ vertexIndex( temp ) ] ;
			path.add( temp ) ;
		}
		
		// flip it frontward, iterate it, and return
		Collections.reverse( path ) ;
		Iterator<T> itPath = path.iterator() ;
		return itPath ;
	}
	
	
	
	
	
	
	
	
	/*
	public static void main(String[] a){
		WDGraph<String> graph = new WDGraph<String>();
		Iterator<String> iter;
		
		graph.addVertex("EWR");
		//System.out.println(graph);

		graph.addVertex("LAX");
		//System.out.println(graph);

		graph.addVertex("SFO");
		graph.addVertex("JFK");
		graph.addVertex("ORD");
		graph.addVertex("ATL");
		graph.addVertex("DEN");
		graph.addVertex("IAD");
		graph.addVertex("IAH");
		graph.addVertex("BOS");
		
		graph.addEdge("EWR", "LAX", 1500);
		graph.addEdge("LAX", "SFO", 500);
		graph.addEdge("EWR", "IAD", 300);
		graph.addEdge("EWR", "ATL", 700);
		graph.addEdge("ATL", "LAX", 1200);
		graph.addEdge("ATL", "ORD", 900);
		graph.addEdge("ORD", "SFO", 1300);
		graph.addEdge("ORD", "DEN", 1000);
		graph.addEdge("DEN", "IAH", 600);
		graph.addEdge("JFK", "BOS", 500);
		graph.addEdge("BOS", "JFK", 500);
		graph.addEdge("BOS", "LAX", 2500);
		
		System.out.println(graph);
		
		//graph.removeVertex("LAX");
		//System.out.println(graph);

		System.out.println("neighbors of EWR");
		iter = graph.neighbors("EWR");
		while(iter.hasNext())
			System.out.printf("%s ", iter.next());
		System.out.println();
		
		System.out.println(graph.nextNeighbor("EWR", "ATL"));
		
		
		
		iter = graph.DFS("EWR");
		while(iter.hasNext())
			System.out.printf("%s ", iter.next());
		System.out.println();		

		
		iter = graph.BFS("EWR");
		while(iter.hasNext())
			System.out.printf("%s ", iter.next());
		System.out.println();		
		
		System.out.println("Path from EWR to IAH:");

		iter = graph.path("EWR", "IAH");
		while(iter.hasNext())
			System.out.printf("%s ", iter.next());
		System.out.println();
		
		System.out.printf("num components: %d\n", graph.numComponents());
		
		System.out.println( graph.isConnected()? "Connected": "not connected");
		
	}
	*/

}
