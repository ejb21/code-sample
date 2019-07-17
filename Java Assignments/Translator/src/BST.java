import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
/**
 *
 *This a BST based Dictionary.  CIT360 in-class use application
 *
 * @param <Key>	Must be comparable and unique
 * @param <Value>
 */
public class BST <Key extends Comparable<Key>, Value>{

	
	private class Node {
        private Key key;           
        private Value val;         
        private Node left, right; 
    


        public Node(Key key, Value val) {
            this.key = key;
            this.val = val;
            this.left = null;
            this.right = null;
        }
    }//end Node
	
	
	
	private Node root;

	
	
    public BST() {root = null;}
    
    
    public int size(){
    	return size(root);
    }
    
    
    private int size(Node n){
    	if(n == null)
    		return 0;
    	return 1 + size(n.left) + size(n.right);
    }
    
    public boolean isEmpty(){
    	return (root == null);
    	//return (size() == 0);
    }

	public void insert(Key k, Value v){  
		root = insert(root, k, v);
	}
	
	private Node insert(Node n, Key k, Value v){
		if(n == null)
			return new Node(k, v);
		else{
			int comp = k.compareTo(n.key);
			if(comp == 0){
				n.val = v;   //The keys must be unique, since the already exists, 
								//only modify the value
			}
			else if (comp < 0)
				n.left = insert(n.left, k, v);
			else
				n.right =  insert(n.right, k, v);
			return n;
			
		}
	}
	
	
	public List<Key> inOrder(){
		return inOrder(root);		
	}
	

	
	private List<Key> inOrder(Node n){
		
		ArrayList<Key> list = new ArrayList<Key>();
		SimpleStack<Node> stack = new SimpleStack<Node>();
	
		if(n != null)
			stack.push(n);
		Node temp;
		
		while(!stack.isEmpty()){
		   temp = stack.pop();
		   //System.out.println("Node " + temp.key);
		   if(temp == null)
			   continue;
		   if((temp.left == null) && (temp.right == null))
			   list.add(temp.key);
		   else{
			   stack.push(temp.right);
			   stack.push(new Node(temp.key, temp.val));
			   stack.push(temp.left);
		   }
		}
			
		return list;
	}
		
	
	
	
	public List<Key> preOrder(){
		ArrayList<Key> list = new ArrayList<Key>();
		
		return preOrder(root);
		
		
		
	}

	
	private List<Key> preOrder(Node n){
		
		ArrayList<Key> list = new ArrayList<Key>();
		SimpleStack<Node> stack = new SimpleStack<Node>();
	
		if(n != null)
			stack.push(n);
		Node temp;
		
		while(!stack.isEmpty()){
		   temp = stack.pop();
		   //System.out.println("Node " + temp.key);
		   if(temp == null)
			   continue;
		   if((temp.left == null) && (temp.right == null))
			   list.add(temp.key);
		   else{
			   stack.push(temp.right);
			   stack.push(temp.left);
			   stack.push(new Node(temp.key, temp.val));
		   }
		}
			
		return list;
	}
		
	
	
	
	
	
	public List<Key> postOrder(){
		return postOrder(root);	
	}
	
	
	private List<Key> postOrder(Node n){
		
		ArrayList<Key> list = new ArrayList<Key>();
		SimpleStack<Node> stack = new SimpleStack<Node>();
	
		if(n != null)
			stack.push(n);
		Node temp;
		
		while(!stack.isEmpty()){
		   temp = stack.pop();

		   if(temp == null)
			   continue;
		   if((temp.left == null) && (temp.right == null))
			   list.add(temp.key);
		   else{
			   stack.push(new Node(temp.key, temp.val));
			   stack.push(temp.right);
			   stack.push(temp.left);
		   }
		}
			
		return list;
	}
		

	public List<Key> levelOrder(){
		return levelOrder(root);	
	}
	
	
	private List<Key> levelOrder(Node n){
		
		ArrayList<Key> list = new ArrayList<Key>();
		SimpleQueue<Node> que = new SimpleQueue<Node>();
	
		if(n != null)
			que.enqueue(n);
		Node temp;
		
		while(!que.isEmpty()){
		   temp = que.dequeue();

		   if(temp == null)
			   continue;
		   //if((temp.left == null) && (temp.right == null))
			   list.add(temp.key);
		   //else{
			   //que.enqueue(new Node(temp.key, temp.val));
			   que.enqueue(temp.left);
			   que.enqueue(temp.right);
		   //}
		}
			
		return list;
	}
		

	
/*	
	private void postOrder(Node n){
		   if(n == null)
			   return;
		
		   inOrder(n.left);
		   inOrder(n.right);
		   System.out.println(n.key);
	}
*/
	
	
	public boolean containsKey(Key k){
		return containsKey(root, k);
	}
	
	
	public boolean containsKey(Node n, Key k){
		if(n == null || k == null)
			return false;
		int comp = n.key.compareTo(k);
		if (comp == 0)
			return true;
		else if(comp > 0)
			return containsKey(n.left, k);
		else
			return containsKey(n.right, k);
	}
	
	
	
	
	public Value get(Key k){
		//if(!this.containsKey(k))
		//	throw new NoSuchElementException("Key " + k + " does not exist");
		if(k == null)
			return null;
		return get(root, k);
	}
	
	
	private Value get(Node n, Key k){
		if(n == null)
			return null;
		int comp = n.key.compareTo((k));
		if(comp == 0)
			return n.val;
		if(comp > 0)
			return get(n.left, k);
		return get(n.right, k);
		

	}
	
	
	
	public Key parent (Key k){
		if(!this.containsKey(k))
			return null;

		if(root.key.compareTo(k) == 0)
			return null;
		
		return parentHelper(root, k);
	}
	
	

	private Key parentHelper (Node n, Key k){
		
		
		if(n == null || k == null)
			return null;
		//if(n.left.key.compareTo(k) == 0 || n.right.key.compareTo(k) == 0)
			//return n.key;	
		
		
		if((n.left != null && n.left.key.compareTo(k) == 0) || (n.right != null && n.right.key.compareTo(k) == 0))
			return n.key;
		
		if(n.key.compareTo(k) > 0)
			return parentHelper(n.left, k);
		
		else //i(n.key.compareTo(k) < 0)
			return parentHelper(n.right, k);
			
	
	}
	
	
	/**
	 * return the height of the BST
	 * 
	 * @return
	 */
	public int height(){
		return height(root);
		
	}
	
	private int height(Node n){
		if(n == null)
			return 0;
		return 1 + Math.max(height(n.left), height(n.right));
	}
	
	
	
	
	/**
	 * remove the pair (k, v) from the tree and return its value
	 * 
	 * @param k
	 * @return
	 */
	public Value remove(Key k){
		
		if(!this.containsKey(k))
			return null;
		
		return remove(root, k);
	}
	
	
	private Value remove(Node n, Key k){
		int comp = n.key.compareTo(k);
		if (comp < 0)
			return remove(n.right, k);
		else if(comp > 0)
			return remove(n.left, k);
		else{  //deleting the node n
			if(n.left == null && n.right == null) { //leaf node
			    //find the parent and nulify the link
			}
			else if(n.left == null){ //it does not have left child
				//set the parent right to be n.right
				
			}
			else if(n.left.right == null){
				// the biggest element if the left child itself
				Node temp = n.left;
				n.left = temp.left;
				n.key = temp.key;
				n.val = temp.val;
				
			}
			else{
				//find the biggest child on the left
				
				if(true){  //the biggest left child is leaf){
					
				}
				else{  //the biggest left child has a left child of its own
					
				}
					
						
						
				
			}
			
			return null;
		}

	}
	
	
	
	//need to write the remove element method
}
