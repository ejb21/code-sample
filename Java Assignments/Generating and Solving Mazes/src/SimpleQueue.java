import java.util.ArrayList;

public class SimpleQueue <E>{
	private ArrayList<E> queue;
	private int size;
	
	public SimpleQueue(){
		queue = new ArrayList<E>();
		size = 0;
	}
	
	public int size(){
		return size;
	}
	
	public boolean isEmpty(){
		return (size == 0);
	}
	
	public E dequeue(){
		if(size == 0)
			return null;
		E temp = queue.remove(size -1);
		size--;
		return temp;
	}
	
	public void enqueue(E e){
		queue.add(0, e);
		size++;
	}

	public E first(){
		if(size == 0)
			return null;
		return queue.get(size -1);
	}
	
	public E get( int i )
	{
		return queue.get( i ) ;
	}
	
	
/*	
	public static void main(String[] a){
		SimpleQueue<Integer> q = new SimpleQueue();
		q.enqueue(4);
		q.enqueue(5);
		q.enqueue(9);
		q.enqueue(12);
		
		while(!q.isEmpty()){
			System.out.println(q.dequeue());
		}
	}
*/
	
	

}