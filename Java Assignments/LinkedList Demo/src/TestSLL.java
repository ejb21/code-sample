
public class TestSLL
{
	public static void main ( String[] args )
	{
		SingleLinkedList<String> list = new SingleLinkedList<String>() ;

		list.insertFirst( "Mookie" ) ;
		list.insertFirst( "Bennie" ) ;
		list.insertFirst( "Raffy" ) ;
		list.insertLast( "Hanley" ) ;
		list.insert( "Bogey" , 3 ) ;
		
		System.out.println( list.toString() ) ;

		
		
		
		//  Below are VARIOUS test cases associated with these classes
		//      ->   They won't all work in unison
		
		
		//   PLEASE NOTE:
		//
		//     The previous() method is not used locally. I've tested it, and it works,
		//	   but I couldn't find a suitable place to stick it within an existing SingleLinkedList
		//	   method without gumming things up or harming efficiency.
		//
		//	   That little yellow warning triangle is a nuisance, but if you set the method
		//	   to public you'll find that it's fully functional. (Refer to line 61.)
		
		
		
		/*
		if ( list.contains( "Raffy" ) )
			System.out.println( "yes" ) ;
		else
			System.out.println( "no" ) ;

		System.out.println() ;
		System.out.println( list.getLast() ) ;
		System.out.println( list.getFirst() ) ;

		System.out.println() ;
		list.removeLast() ;
		System.out.println( list.toString() ) ;
		
		System.out.println( list.removeFirst() ) ;
		System.out.println() ;
		System.out.println( list.toString() ) ;

		System.out.println() ;
		list.replace( "Bennie" , "Chris fucking Sale" ) ;
		System.out.println( list.toString() ) ;
		
		System.out.println() ;
		list.reverse() ;
		System.out.println( list.toString() ) ;
		
		System.out.println() ;
		System.out.println( list.previous( new SLLNode<String>( "Bennie" , null ) ) ) ;
		
		System.out.println() ;
		System.out.println( list.max() ) ;
		list.sort() ;
		System.out.println() ;
		System.out.println( list.toString() ) ;

		System.out.println() ;
		
		Rectangle two = new Rectangle( 2 , 2 ) ;
		Rectangle ten = new Rectangle( 10 , 10 ) ;
		Rectangle five = new Rectangle( 5 , 5 ) ;

		SingleLinkedList<Rectangle> rectList = new SingleLinkedList<Rectangle>() ;
		
		rectList.insertFirst( five ) ;
		rectList.insertFirst( ten ) ;
		rectList.insertFirst( two ) ;
		
		System.out.println( rectList.toString() ) ;
		System.out.println( rectList.max() ) ;
		
		rectList.sort() ;
		System.out.println() ;
		System.out.println( rectList.toString() ) ;
		*/
	}
}