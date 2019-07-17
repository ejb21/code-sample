
public class SLLNode<E>
{
	private E data ;
	private SLLNode<E> next ;
	
	public SLLNode( E data , SLLNode<E> next )
	{
		super() ;
		this.data = data ;
		this.next = next ;
	}
	
	public SLLNode( E data )
	{
		super() ;
		this.data = data ;
		this.next = null ;
	}

	public SLLNode()
	{
		super() ;
	}

	public E getData()
	{
		return data ;
	}

	public void setData( E data )
	{
		this.data = data ;
	}

	public SLLNode<E> getNext()
	{
		return next ;
	}

	public void setNext(SLLNode<E> next)
	{
		this.next = next ;
	}

	@Override
	public String toString() {
		// return "SLLNode [data=" + data + ", next=" + next + "]" ;
		
		return "" + data + "\n" ;
	}
}