// Eric Budd
// 17 September 2015
// This program demos the Rectangle class

public class RectangleDriver {

	public static void main(String[] args) {
		
		// Declare object of Rectangle class
		Rectangle rect1 = new Rectangle();
		
		System.out.println(rect1.getArea());
		
		rect1.setLength(69);
		rect1.setWidth(69.69);
		System.out.println(rect1.getLength());
		System.out.println(rect1.getWidth());
		System.out.println(rect1.getArea());
		
		Rectangle rect2 = new Rectangle();
		rect2.setLength(6);
		rect2.setWidth(9);
		
		Rectangle rect3 = new Rectangle(6.9, 6.9);
		System.out.println(rect3.getArea());
		
	}
}