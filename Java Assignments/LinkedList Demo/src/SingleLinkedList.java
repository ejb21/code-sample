
public class SingleLinkedList<E extends Comparable<E>> implements SingleLinkedListADT<E>
{
	private SLLNode<E> head ;
	private SLLNode<E> tail ;
	private int size ;
	
	public SingleLinkedList()
	{
		super() ;
		size = 0 ;
	}

	@Override
	public void insertFirst( E e )
	{
		SLLNode<E> temp = new SLLNode<E>( e , null ) ;
		temp.setNext( head ) ;
		
		if ( isEmpty() ) head = tail = temp ;
		else
		{
			temp.setNext( head ) ;
			head = temp ;
		}
		
		size++ ;
	}

	@Override
	public void insertLast( E e )
	{
		SLLNode<E> temp = new SLLNode<E>( e , null ) ;
		
		if ( isEmpty() ) head = tail = temp ;
		else
		{
			tail.setNext( temp ) ;
			tail = temp ;
		}
		
		size++ ;
	}

	@Override
	public void insert( E e , int index )
	{
		if ( index > size ) return ;
		
		if ( this.isEmpty() )
		{
			head = tail = new SLLNode<E>( e ) ;
			size++ ;
			return ;
		}
		
		if ( index == size )
		{
			this.insertLast( e ) ;
			return ;
		}
		
		if ( index == 0 )
		{
			this.insertFirst( e ) ;
			return ;
		}
		
		SLLNode<E> temp = head ;
		
		for ( int i = 0 ;  i < index - 1 ;  i++ )
			temp = temp.getNext();
		
		SLLNode<E> newNode = new SLLNode<E>( e ) ;
		newNode.setNext( temp.getNext() ) ;
		temp.setNext( newNode ) ;
		size++ ;
	}

	@Override
	public boolean isEmpty()
	{
		return ( size == 0 ) ;
	}

	@Override
	public int size()
	{
		return size ;
	}

	@Override
	public E removeFirst()
	{
		E data ;
		
		if ( isEmpty() ) return null ;
		
		else if ( size == 1 )
		{
			data = head.getData() ;
			head = null ;
			tail = null ;
			size-- ;
			return data ;
		}
		
		else
		{
			data = head.getData() ;
			head = head.getNext() ;
			size-- ;
			return data ;
		}
	}

	@Override
	public E removeLast()
	{
		E data ;
		
		if ( isEmpty() ) return null ;
		
		else if ( size == 1 ) 
		{
			data = tail.getData() ;
			head = null ;
			tail = null ;
			size-- ;
			return data ;
		} 
		
		else 
		{
			SLLNode<E> temp = head ;
			data = tail.getData() ;
			
			while ( temp.getNext() != tail )
				temp = temp.getNext() ;
			
			tail = temp ;
			tail.setNext( null ) ;
			
			return data ;
		}
	}

	@Override
	public E remove( int index )
	{
		if ( isEmpty() ) return null;
		if ( index == 0 ) return ( removeFirst() );
		if ( index == size ) return ( removeLast() ) ;
		
		E data ;
		SLLNode<E> temp = head ;
		
		for ( int i = 0 ;  i < index - 1 ;  i++ )
			temp = temp.getNext() ;
		
		data = temp.getNext().getData();
		temp.setNext( temp.getNext().getNext() ) ;

		return data ;
	}

	@Override
	public boolean contains( E e )
	{
		SLLNode<E> temp = head ;
		
		while ( temp != null )
		{
			if ( temp.getData().compareTo( e ) == 0 )
				return true ;
			
			temp = temp.getNext() ;
		}
		
		return false ;
	}

	@Override
	public int position( E e )
	{
		if ( size == 0 || !contains( e ) ) return -1 ;
		
		int pos = 0;
		SLLNode<E> temp = head ;
		
		while ( temp != null )
		{
			if ( temp.getData().compareTo( e ) == 0 )
				return pos ;

			temp = temp.getNext() ;
			pos++ ;
		}
		
		return pos ;
	}

	@Override
	public void replace( E e , E value )
	{
		if ( size == 0 || !contains( e ) ) return ;

		insert( value , position ( e ) ) ;
		remove( position( e ) ) ;
	}

	@Override
	public E getFirst()
	{
		if ( isEmpty() ) return null ;
		
		return head.getData() ;
	}

	@Override
	public E getLast()
	{
		if ( isEmpty() ) return null ;
		
		return tail.getData() ;
	}

	@Override
	public E get( int index )
	{
		SLLNode<E> temp = head ;
		
		for ( int i = 0 ;  i < index ;  i++ )
			temp = temp.getNext() ;
		
		return temp.getData() ;
	}
	
	public String toString()
	{
		String str = "" ;
		SLLNode<E> temp = head ;
		
		while ( temp != null )
		{
			str += temp.toString() ;
			temp = temp.getNext() ;
		}
		
		return str ;
	}
	
	public E min()
	{
		if ( isEmpty() ) return null ;
		
		SLLNode<E> temp = head ;
		E data = temp.getData() ;
		
		while ( temp.getNext() != null )
		{
			if ( data.compareTo( temp.getNext().getData() ) > 0 )
				data = temp.getNext().getData() ;

			temp = temp.getNext();
		}
		
		return data ;
	}
	
	public E max()
	{
		if ( isEmpty() ) return null ;
		
		SLLNode<E> temp = head ;
		E data = temp.getData() ;
		
		while ( temp.getNext() != null )
		{
			if ( data.compareTo( temp.getNext().getData() ) < 0 )
				data = temp.getNext().getData() ;

			temp = temp.getNext();
		}
		
		return data ;
	}
	
	public void reverse()
	{
		if ( isEmpty() || size == 1 ) return ;
		
		for ( int i = size ;  i > 0 ;  i-- )
		{
			insert( head.getData() , i ) ;
			removeFirst() ;
		}
	}
	
	private SLLNode<E> previous( SLLNode<E> node )
	{
		try
		{
			if ( isEmpty() || size == 1 || !contains( node.getData() ) ) return null ;
	
			SLLNode<E> temp = head ;
			
			while ( temp.getNext().getData().compareTo( node.getData() ) != 0 )
				temp = temp.getNext() ;
			
			return temp ;
		}
		catch ( NullPointerException e )
		{
			return null ;
		}
	}
	
	public void sort()
	{
		if ( isEmpty() || size == 1 ) return ;
		
		else if ( size == 2 && head.getData().compareTo( tail.getData() ) > 0 )
		{
			insertLast( head.getData() ) ;
			removeFirst() ;
		}
		
		else
		{
			SLLNode<E> temp = head ;
			SLLNode<E> min = new SLLNode<E>() ;
			
			while( temp != null )
			{
				min = temp ;
				SLLNode<E> test = temp.getNext() ;
				
				while( test != null )
				{
					if ( min.getData().compareTo( test.getData() ) > 0 ) min = test ;
					
					test = test.getNext() ;
				}

				replace( min.getData() , temp.getData() ) ;
				replace( temp.getData() , min.getData() ) ;
				
				temp = temp.getNext() ;
			}
		}
	}
}













