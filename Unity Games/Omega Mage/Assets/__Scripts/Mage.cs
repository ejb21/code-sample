using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.Linq;


public enum MPhase { idle , down , drag }
	
public enum ElementType { earth , water , air , fire , aether , none }


[System.Serializable]
public class MouseInfo
{
	public Vector3		loc ;
	public Vector3		screenLoc ;
	public Ray			ray ;
	public float		time ;
	public RaycastHit	hitInfo ;
	public bool			hit ;

	public RaycastHit Raycast()
	{
		hit = Physics.Raycast( ray , out hitInfo ) ;
		return ( hitInfo ) ;
	}

	public RaycastHit Raycast ( int mask )
	{
		hit = Physics.Raycast( ray , out hitInfo , mask ) ;
		return ( hitInfo ) ;
	}
}


public class Mage : PT_MonoBehaviour
{
	static public Mage		S ;
	static public bool		DEBUG = true ;

	public float			mTapTime = 0.1f ;
	public GameObject		tapIndicatorPrefab ;

	public float			mDragDist = 5 ;

	public float			activeScreenWidth = 1 ;

	public float			speed = 2 ;

	public GameObject[]		elementPrefabs ;
	public float			elementRotDist = 0.5f ;
	public float			elementRotSpeed = 0.5f ;
	public int				maxNumSelectedElements = 1 ;
	public Color[]			elementColors ;

	public float			lineMinDelta = 0.1f ;
	public float			lineMaxDelta = 0.5f ;
	public float			lineMaxLength = 8f ;

	public GameObject		fireGroundSpellPrefab ;
	public GameObject		lifeGroundSpellPrefab ;
	public GameObject		iceGroundSpellPrefab ;
	public GameObject		windGroundSpellPrefab ;

	public float			health = 4 ;
	public float			damageTime = -100 ;

	public float			knockbackDist = 1 ;
	public float			knockbackDur = 0.5f ;
	public float			invincibleDur = 0.5f ;
	public int				invTimesToBlink = 4 ;

	public bool				_____________________________ ;

	private bool			invincibleBool = false ;
	private bool			knockbackBool = false ;
	private Vector3			knockbackDir ;
	private Transform		viewCharacterTrans ;

	protected Transform		spellAnchor ;

	public float			totalLineLength ;
	public List< Vector3 >	linePts ;
	protected LineRenderer	liner ;
	protected float			lineZ = -0.1f ;

	public MPhase			mPhase = MPhase.idle ;
	public List< MouseInfo > mouseInfos = new List< MouseInfo >() ;
	public string			actionStartTag ;

	public bool				walking = false ;
	public Vector3			walkTarget ;
	public Transform		characterTrans ;

	public List< Element >	selectedElements = new List< Element >() ;

	public AudioClip		hurt ;


	void Awake()
	{
		S = this ;
		mPhase = MPhase.idle ;

		characterTrans = transform.Find( "CharacterTrans" ) ;
		viewCharacterTrans = characterTrans.Find( "View_Character" ) ;

		liner = GetComponent< LineRenderer >() ;
		liner.enabled = false ;

		GameObject saGO = new GameObject( "Spell Anchor" ) ;

		spellAnchor = saGO.transform ;
	}


	void Update()
	{
		bool b0Down = Input.GetMouseButtonDown( 0 ) ;
		bool b0Up = Input.GetMouseButtonUp( 0 ) ;

		bool inActiveArea = ( float ) Input.mousePosition.x / Screen.width < activeScreenWidth ;

		if ( mPhase == MPhase.idle )
		{
			if ( b0Down && inActiveArea )
			{
				mouseInfos.Clear() ;
				AddMouseInfo() ;

				if ( mouseInfos[0].hit )
				{
					MouseDown() ;
					mPhase = MPhase.down ;
				}
			}
		}

		if ( mPhase == MPhase.down )
		{
			AddMouseInfo() ;

			if ( b0Up )
			{
				MouseTap() ;
				mPhase = MPhase.idle ;
			}
			else if ( Time.time - mouseInfos[0].time > mTapTime )
			{
				float dragDist = ( lastMouseInfo.screenLoc - mouseInfos[0].screenLoc ).magnitude ;

				if ( dragDist >= mDragDist )
				{
					mPhase = MPhase.drag ;
				}

				if ( selectedElements.Count == 0 )		{
					mPhase = MPhase.drag ;				}
			}
		}

		if ( mPhase == MPhase.drag )
		{
			AddMouseInfo() ;

			if ( b0Up )
			{
				MouseDragUp() ;
				mPhase = MPhase.idle ;
			}
			else 					{
				MouseDrag() ;		}
		}

		OrbitSelectedElements() ;
	}


	MouseInfo AddMouseInfo()
	{
		MouseInfo mInfo = new MouseInfo () ;
		mInfo.screenLoc = Input.mousePosition ;
		mInfo.loc = Utils.mouseLoc ;
		mInfo.ray = Utils.mouseRay ;

		mInfo.time = Time.time ;
		mInfo.Raycast() ;

		if ( mouseInfos.Count == 0 )		{
			mouseInfos.Add( mInfo ) ;		}
		else
		{
			float lastTime = mouseInfos[ mouseInfos.Count - 1 ].time ;

			if ( mInfo.time != lastTime )
			{
				mouseInfos.Add( mInfo ) ;
			}
		}

		return ( mInfo ) ;
	}


	public MouseInfo lastMouseInfo
	{
		get
		{
			if ( mouseInfos.Count == 0 ) return ( null ) ;
			return (mouseInfos[ mouseInfos.Count - 1 ] ) ;
		}
	}


	void MouseDown()
	{
		if ( DEBUG ) print ( "Mage.MouseDown()" ) ;

		GameObject clickedGO = mouseInfos[0].hitInfo.collider.gameObject ;
		GameObject taggedParent = Utils.FindTaggedParent( clickedGO ) ;

		if ( taggedParent == null )					{
			actionStartTag = "" ;					}
		else 										{
			actionStartTag = taggedParent.tag ;		}
	}


	void MouseTap()
	{
		if ( DEBUG ) print ( "Mage.MouseTap()" ) ;

		switch ( actionStartTag )
		{
			case "Mage" :
				break ;

			case "Ground" :
				WalkTo ( lastMouseInfo.loc ) ;
				ShowTap ( lastMouseInfo.loc ) ;
				break ;
		}
	}


	void MouseDrag()
	{
		if ( DEBUG ) print ( "Mage.MouseDrag()" ) ;
		if ( actionStartTag != "Ground" ) return ;

		if ( selectedElements.Count == 0 )									{
			WalkTo ( mouseInfos[ mouseInfos.Count - 1 ].loc ) ;				}
		else 																{
			AddPointToLiner( mouseInfos[ mouseInfos.Count - 1 ].loc ) ;		}
	}


	void MouseDragUp()
	{
		if ( DEBUG ) print ( "Mage.MouseDragUp()" ) ;
		if ( actionStartTag != "Ground" ) return ;

		if ( selectedElements.Count == 0 )		{
			StopWalking() ;						}
		else
		{
			CastGroundSpell() ;
			ClearLiner() ;
		}
	}


	void CastGroundSpell()
	{
		if ( selectedElements.Count == 0 ) return ;

		switch ( selectedElements[0].type )
		{
			case ElementType.fire :
				GameObject fireGO ;

				foreach ( Vector3 pt in linePts )
				{
					fireGO = Instantiate ( fireGroundSpellPrefab ) as GameObject ;
					fireGO.transform.parent = spellAnchor ;
					fireGO.transform.position = pt ;
				}

				break;
			
			case ElementType.water :
				GameObject waterGO ;

				foreach ( Vector3 pt in linePts )
				{
					waterGO = Instantiate ( iceGroundSpellPrefab ) as GameObject ;
					waterGO.transform.parent = spellAnchor ;
					waterGO.transform.position = pt ;
				}

				break;

			case ElementType.air :
				GameObject airGO ;

				foreach ( Vector3 pt in linePts )
				{
					airGO = Instantiate ( windGroundSpellPrefab ) as GameObject ;
					airGO.transform.parent = spellAnchor ;
					airGO.transform.position = pt ;
				}

				break ;

			case ElementType.earth :
				GameObject earthGO ;

				foreach ( Vector3 pt in linePts )
				{
					earthGO = Instantiate ( lifeGroundSpellPrefab ) as GameObject ;
					earthGO.transform.parent = spellAnchor ;
					earthGO.transform.position = pt ;
				}

				break ;
		}

		ClearElements();
	}


	public void WalkTo ( Vector3 xTarget )
	{
		walkTarget = xTarget ;
		walkTarget.z = 0 ;
		walking = true ;
		Face ( walkTarget ) ;
	}


	public void Face ( Vector3 poi )
	{
		Vector3 delta = poi-pos ;

		float rZ = Mathf.Rad2Deg * Mathf.Atan2( delta.y , delta.x ) ;

		characterTrans.rotation = Quaternion.Euler( 0 , 0 , rZ ) ;
	}


	public void StopWalking()
	{
		walking = false ;
		GetComponent< Rigidbody >().velocity = Vector3.zero ;
	}


	void FixedUpdate ()
	{
		if ( invincibleBool )
		{
			float blinkU = ( Time.time - damageTime ) / invincibleDur ;
			blinkU *= invTimesToBlink ;
			blinkU %= 1.0f ;

			bool visible = ( blinkU > 0.5f ) ;

			if ( Time.time - damageTime > invincibleDur )
			{
				invincibleBool = false ;
				visible = true ;
			}

			viewCharacterTrans.gameObject.SetActive( visible ) ;
		}

		if ( knockbackBool )
		{
			if ( Time.time - damageTime > knockbackDur )		{
				knockbackBool = false ;							}
			
			float knockbackSpeed = knockbackDist / knockbackDur ;
			vel = knockbackDir * knockbackSpeed ;
			return ;
		}

		if ( walking )
		{
			if ( ( walkTarget - pos ).magnitude < speed * Time.fixedDeltaTime )
			{
				pos = walkTarget ;
				StopWalking() ;
			} else 																					{
				GetComponent< Rigidbody >().velocity = ( walkTarget - pos ).normalized * speed;		}
		} else 															{
			GetComponent< Rigidbody >().velocity = Vector3.zero ;		}
	}


	void OnCollisionEnter ( Collision coll )
	{
		GameObject otherGO = coll.gameObject ;

		Tile ti = otherGO.GetComponent< Tile >() ;

		if ( ti != null )
		{
			if ( ti.height > 0 )		{
				StopWalking() ;			}
		}

		EnemyBug bug = coll.gameObject.GetComponent< EnemyBug >() ;

		if ( bug != null ) CollisionDamage ( bug ) ;
		// if ( bug != null ) CollisionDamage ( otherGO ) ;
	}


	void OnTriggerEnter ( Collider other )
	{
		EnemySpiker spiker = other.GetComponent< EnemySpiker >() ;

		if ( spiker != null )
		{
			CollisionDamage ( spiker ) ;
			// CollisionDamage ( other.gameObject ) ;
		}
	}


	void CollisionDamage ( Enemy enemy )
	{
		if ( invincibleBool ) return ;

		StopWalking() ;
		ClearInput() ;

		health -= enemy.touchDamage ;

		if ( health <= 0 )
		{
			Die() ;
			return ;
		}

		damageTime = Time.time ;
		knockbackBool = true ;
		knockbackDir = ( pos - enemy.pos ).normalized ;
		invincibleBool = true ;

		GetComponent< AudioSource >().clip = hurt ;
		GetComponent< AudioSource >().Play() ;
	}


	void Die()								{
		Application.LoadLevel( 0 ) ;		}


	public void ShowTap ( Vector3 loc )
	{
		GameObject go = Instantiate ( tapIndicatorPrefab ) as GameObject ;
		go.transform.position = loc ;
	}


	public void SelectElement ( ElementType elType )
	{
		if ( elType == ElementType.none )
		{
			ClearElements() ;
			return ;
		}
		
		if ( maxNumSelectedElements == 1 )		{
			ClearElements() ;					}

		if ( selectedElements.Count >= maxNumSelectedElements ) return ;

		GameObject go = Instantiate ( elementPrefabs[( int ) elType]) as GameObject ;

		Element el = go.GetComponent< Element >() ;
		el.transform.parent = this.transform ;
		
		selectedElements.Add( el ) ;
	}


	public void ClearElements()
	{
		foreach ( Element el in selectedElements )		{
			Destroy ( el.gameObject ) ;					}
		
		selectedElements.Clear() ;
	}


	void OrbitSelectedElements()
	{
		if ( selectedElements.Count == 0 ) return ;

		Element el ;
		Vector3 vec ;
		float theta0 , theta ;
		float tau = Mathf.PI * 2 ;

		float rotPerElement = tau / selectedElements.Count ;

		theta0 = elementRotSpeed * Time.time * tau ;
		
		for ( int i = 0 ;  i < selectedElements.Count ;  i++ )
		{
			theta = theta0 + i * rotPerElement ;
			el = selectedElements[i] ;

			vec = new Vector3 ( Mathf.Cos( theta ) , Mathf.Sin( theta ) , 0 ) ;

			vec *= elementRotDist ;

			vec.z = -0.5f ;
			el.lPos = vec ;
		}
	}


	void AddPointToLiner ( Vector3 pt )
	{
		pt.z = lineZ ;

		// linePts.Add(pt);
		// UpdateLiner();

		// linePts.Add(pt);
		// UpdateLiner();

		if ( linePts.Count == 0 )
		{
			linePts.Add( pt ) ;
			totalLineLength = 0 ;
			return ;
		}

		if ( totalLineLength > lineMaxLength ) return ;

		Vector3 pt0 = linePts[ linePts.Count - 1 ] ;
		Vector3 dir = pt - pt0 ;
		float delta = dir.magnitude ;
		dir.Normalize() ;
		totalLineLength += delta ;

		if ( delta < lineMinDelta )		{
			return ;					}

		if ( delta > lineMaxDelta )
		{
			float numToAdd = Mathf.Ceil( delta / lineMaxDelta ) ;
			float midDelta = delta / numToAdd ;
			Vector3 ptMid ;

			for ( int i = 1 ;  i < numToAdd ;  i++ )
			{
				ptMid = pt0 + ( dir * midDelta * i ) ;
				linePts.Add( ptMid ) ;
			}
		}

		linePts.Add( pt ) ;
		UpdateLiner() ;
	}


	public void UpdateLiner()
	{
		int el = ( int ) selectedElements[0].type ;

		liner.SetColors( elementColors[el] , elementColors[el] ) ;

		liner.SetVertexCount( linePts.Count ) ;

		for ( int i=0 ;  i < linePts.Count ;  i++ )			{
			liner.SetPosition( i , linePts[i] ) ;			}
		
		liner.enabled = true ;
	}


	public void ClearLiner()
	{
		liner.enabled = false ;
		linePts.Clear() ;
	}


	public void ClearInput()			{
		mPhase = MPhase.idle ;			}
}