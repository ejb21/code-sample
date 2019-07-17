
public class WGraph<T> extends WDGraph<T>{

	public WGraph() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public void addEdge(T vertex1, T vertex2, double weight) {
		super.addEdge(vertex1, vertex2, weight);
		super.addEdge(vertex2, vertex1, weight);
	}
	
	@Override
	public void removeEdge(T vertex1, T vertex2) {
		super.removeEdge(vertex1, vertex2);
		super.removeEdge(vertex2, vertex1);
	}
	
	@Override
	public int numEdges() {   // to be written
		return super.numEdges()/2;
	}
	
	
	
}
