
public class DGraph<T> extends WDGraph<T>{
	private int WEIGHT = 1;

	public DGraph() {
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
}
