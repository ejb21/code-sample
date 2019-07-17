import java.util.Iterator;

public class Graph<T> extends WGraph<T>{
	private int WEIGHT = 1;
	
	public Graph() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public void addEdge(T vertex1, T vertex2) {
		super.addEdge(vertex1, vertex2, WEIGHT);
	}
	

	@Override
	public void addEdge(T vertex1, T vertex2, double weight) {
		super.addEdge(vertex1, vertex2, WEIGHT);
	}
	

	
	public static void main(String[] a){
		Graph<String> graph = new Graph<String>();
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
		
		graph.addEdge("EWR", "LAX");
		graph.addEdge("LAX", "SFO");
		graph.addEdge("EWR", "IAD");
		graph.addEdge("EWR", "ATL");
		graph.addEdge("ATL", "LAX");
		graph.addEdge("ATL", "ORD");
		graph.addEdge("ORD", "SFO");
		graph.addEdge("ORD", "DEN");
		graph.addEdge("DEN", "IAH");
		graph.addEdge("JFK", "BOS");
		graph.addEdge("BOS", "JFK");
		graph.addEdge("BOS", "LAX");
		
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
		
		System.out.printf("num edges: %d\n", graph.numEdges());
		
		System.out.printf("num components: %d\n", graph.numComponents());
		
		System.out.println( graph.isConnected()? "Connected": "not connected");
		
	}
	
}
