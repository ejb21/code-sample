import java.util.ArrayList;
import java.util.List;

public class SimpleTreeMap<Key extends Comparable<Key>, Value> {

	
	private BST<Key, Value> map;
	
	
	
	public SimpleTreeMap() {
		super();
		
	}


	public int size(){
		return map.size();
	}

	public boolean isEmpty(){
		return map.isEmpty();
	}

	public Value get(Key k){
		return map.get(k);
	}

	public Value put(Key k, Value v){
		map.insert(k, v);
		return v;
	}

	public Value remove(Key k){
		return map.remove(k);
	}

	
	public List<Key> keySet(){
		return map.inOrder();
	}

	public List<Value> values(){
		ArrayList<Value> valList = new ArrayList();
		ArrayList<Key> keys = (ArrayList<Key>) map.inOrder();
		for(Key k : keys)
			valList.add(map.get(k));
		
		return valList;
		
	}
	

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
