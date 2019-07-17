
public interface SingleLinkedListADT<E>
{
	public void insertFirst( E e ) ;
	public void insertLast( E e ) ;
	public void insert( E e , int index ) ;
	public boolean isEmpty() ;
	public int size() ;
	public E removeFirst() ;
	public E removeLast() ;
	public E remove( int index ) ;
	public boolean contains( E e ) ;
	public int position( E e ) ;
	public void replace( E e , E value ) ;
	public E getFirst() ;
	public E getLast() ;
	public E get( int index ) ;
}