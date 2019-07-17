import java.util.ArrayList;
import java.util.List;

public class SimpleMap <Key extends Comparable<Key>, Value>{
	
	
	BST<Key, Value> map;
	
	


	public SimpleMap() {
		super();
		
	}


	public int size(){
		return map.size();
	}


	public boolean isEmpty(){
		return map.isEmpty();
	}
	
	
	public List<Key> keySet(){
		return map.inOrder();
		
	}

	
	
	public List<Value> values(){
		ArrayList<Key> keys = (ArrayList<Key>) map.inOrder();
		ArrayList<Value> vals = new ArrayList();
		for(Key k : keys)
			vals.add(map.get(k));
		return vals;
		
	}








	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
