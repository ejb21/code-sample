import java.util.ArrayList;

public class SimpleStack <E>{
	private ArrayList<E> stack;
	private int size;
	
	public SimpleStack(){
		stack = new ArrayList<E>();
		size = 0;
	}
	
	public int size(){
		return size;
	}
	
	public boolean isEmpty(){
		return (size == 0);
	}
	
	public E pop(){
		if(size == 0)
			return null;
		E temp = stack.remove(0);
		size--;
		return temp;
	}
	
	public void push(E e){
		stack.add(0, e);
		size++;
	}

	public E top(){
		if(size == 0)
			return null;
		return stack.get(0);
	}
	
/*	
	public static void main(String[] a){
		SimpleStack<Integer> stk = new SimpleStack();
		stk.push(4);
		stk.push(5);
		stk.push(9);
		stk.push(12);
		
		while(!stk.isEmpty()){
			System.out.println(stk.pop());
		}
	}
*/	

}
