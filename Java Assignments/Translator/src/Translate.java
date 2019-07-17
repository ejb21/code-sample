//  Eric Budd
//  CIT360
//  Assignment 04 - Translator


import java.awt.Font ;
import java.awt.GridLayout;
import java.awt.event.ActionEvent ;
import java.awt.event.ActionListener ;
import java.io.File ;
import java.io.FileNotFoundException ;
import java.util.Scanner ;
import javax.swing.border.EmptyBorder;
import javax.swing.JButton ;
import javax.swing.JFrame ;
import javax.swing.JLabel ;
import javax.swing.JPanel ;
import javax.swing.JTextField ;
import javax.swing.SwingConstants;



public class Translate
{
	static BST<String, String> tree ;		//  search tree containing "dictionary"
	static File data ;						//  .txt "dictionary" file
	static Scanner scan ;					//  scanner for .txt
	static JLabel translated ;				//  static JLabel for Spanish translation
	
	
	/*
		main method initializes tree and file,
		calls to read file into tree, and calls for the JFrame
	*/
	public static void main( String[] args )
	{
		tree = new BST<String, String>() ;
		data = new File( "src/SpanishEnglishData.txt" ) ;
		
		dataScan() ;
		runWindow() ;
	}
	
	
	/*
		dataScan() reads the .txt "dictionary" file into a BST
	*/
	public static void dataScan()
	{
		try
		{
			scan = new Scanner( data ) ;		//  Scanner for .txt file
		}
		catch ( FileNotFoundException e )
		{
			System.exit( 0 ) ;					//  exits if not found
		}
		
		String temp ;							//  holds each line of .txt
		String[] trans = new String[2] ;		//  String array holds translation
		
		while ( scan.hasNext() )
		{
			temp = scan.nextLine() ;
			trans = temp.split( "\t" ) ;			//  splits English from Spanish
			
			tree.insert( trans[0] , trans[1] ) ;	//  creates tree node with both
		}
		
		scan.close() ;
	}
	
	
	/*
		runWindow() sets up and initializes JFrame
		and calls the translation method upon button press
	*/
	public static void runWindow()
	{
		//  properties of the JFrame window itself
		JFrame window = new JFrame( "Translator" ) ;
		window.setSize( 350, 200 ) ;
		window.setResizable( false ) ;
		window.setDefaultCloseOperation( JFrame.EXIT_ON_CLOSE ) ;
		window.setLayout( new GridLayout( 2 , 1 ) ) ;
		
		//  panel includes English and Spanish labels,
		//  English text box, and Spanish translation
		JPanel panel = new JPanel() ;
		panel.setLayout( new GridLayout( 2 , 2 ) ) ;	//  hence (2,2) dimensions
		
		//  English label and font
		JLabel label = new JLabel( "English word:" , SwingConstants.CENTER ) ;
		Font labelFont = new Font( "Arial" , Font.BOLD , 18 ) ;
		label.setFont( labelFont );
		
		//  Spanish label and font
		JLabel spanLabel = new JLabel( "Spanish word:" , SwingConstants.CENTER ) ;
		spanLabel.setFont( labelFont );
		
		//  text field for English input, centered
		final JTextField text = new JTextField( 25 ) ;
		text.setHorizontalAlignment( JTextField.CENTER ) ;
		
		//  label for Spanish translation of input (initially empty) and font
		translated = new JLabel( "" , SwingConstants.CENTER ) ;
		Font translatedFont = new Font( "Arial" , Font.PLAIN , 18 ) ;
		translated.setFont( translatedFont );
		
		//  "Translate!" button and font; calls translate() method
		JButton button = new JButton( "Translate!" ) ;
		Font buttonFont = new Font( "Arial" , Font.BOLD , 16 ) ;
		button.setFont( buttonFont );
		button.addActionListener( new ActionListener()
		{
			public void actionPerformed( ActionEvent e )
			{
				translate( text.getText() ) ;	//  passes English input as argument
			}
		} ) ;

		//  top panel for the JFrame (variable "window") which has (2,1) GridLayout
		panel.add( label ) ;
		panel.add( spanLabel ) ;
		panel.add( text ) ;
		panel.add( translated ) ;
		panel.setBorder( new EmptyBorder( 10 , 10 , 10 , 10 ) ) ;
		
		//  bottom panel for JFrame ("window") contains "Translate!" button
		JPanel btnPanel = new JPanel() ;
		btnPanel.add( button ) ;
		
		//  adds both panels to (2,1) GridLayout and initializes JFrame
		window.add( panel ) ;
		window.add( btnPanel ) ;
		window.setVisible( true ) ;
	}
	
	
	/*
		translate() method parses BST for translation and updates
		the Spanish label (variable "translated") if one is found
	*/
	public static void translate( String str )	//  parameter is English input
	{
		try
		{
			translated.setText( tree.get( str.toLowerCase() ).toString() ) ;
		}
		catch ( NullPointerException e )
		{
			translated.setText( "Word not found" ) ;	//  no BST node
		}
	}
}