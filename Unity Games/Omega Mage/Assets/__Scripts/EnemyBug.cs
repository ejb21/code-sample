﻿using UnityEngine ;
using System.Collections ;
using System.Collections.Generic ;


public class EnemyBug : PT_MonoBehaviour , Enemy
{
	[SerializeField]
	private float		_touchDamage = 1 ;

	public float		touchDamage
	{
		get { return( _touchDamage ) ; }
		set { _touchDamage = value ; }
	}
	
	public string typeString
	{
		get { return( roomXMLString ) ; }
		set { roomXMLString = value ; }
	}

	public string		roomXMLString ;
	public float		speed = 0.5f ;
	public float		health = 10 ;
	public float		damageScale = 0.8f ;
	public float		damageScaleDuration = 0.25f ;

	public bool _________________________________;

	private float		damageScaleStartTime ;

	private float		_maxHealth ;
	public Vector3		walkTarget ;
	public bool			walking ;
	public Transform	characterTrans ;

	public Dictionary< ElementType , float >	damageDict ;

	public AudioClip	hurt ;
	float				nextSoundTime = 0 ;


	void Awake()
	{
		characterTrans = transform.Find( "CharacterTrans" ) ;
		_maxHealth = health ;
		ResetDamageDict() ;
	}


	void ResetDamageDict()
	{
		if ( damageDict == null )										{
			damageDict = new Dictionary< ElementType , float >() ;		}
		
		damageDict.Clear() ;
		damageDict.Add( ElementType.earth , 0 ) ;
		damageDict.Add( ElementType.water , 0 ) ;
		damageDict.Add( ElementType.air , 0 ) ;
		damageDict.Add( ElementType.fire , 0 ) ;
		damageDict.Add( ElementType.aether , 0 ) ;
		damageDict.Add( ElementType.none , 0 ) ;
	}


	void Update()					{
		WalkTo ( Mage.S.pos ) ;		}


	public void WalkTo ( Vector3 xTarget )
	{
		walkTarget = xTarget ;
		walkTarget.z = 0 ;
		walking = true ;
		Face ( walkTarget ) ;
	}

	public void Face ( Vector3 poi )
	{
		Vector3 delta = poi - pos ;

		float rZ = Mathf.Rad2Deg * Mathf.Atan2( delta.y , delta.x ) ;

		characterTrans.rotation = Quaternion.Euler( 0 , 0 , rZ ) ;
	}


	public void StopWalking()
	{
		walking = false ;
		GetComponent< Rigidbody >().velocity = Vector3.zero ;
	}


	void FixedUpdate()
	{
		if ( walking )
		{
			if ( ( walkTarget - pos ).magnitude < speed * Time.fixedDeltaTime )
			{
				pos = walkTarget ;
				StopWalking() ;
			}
			else																					{
				GetComponent< Rigidbody >().velocity = ( walkTarget - pos ).normalized * speed ;	}
		}
		else														{
			GetComponent< Rigidbody >().velocity = Vector3.zero ;	}
	}


	public void Damage ( float amt , ElementType eT , bool damageOverTime = false )
	{
		if ( damageOverTime )			{
			amt *= Time.deltaTime ;		}

		switch ( eT )
		{
		case ElementType.fire :
			damageDict[ eT ] = Mathf.Max( amt , damageDict[ eT ] ) ;
			break ;
		
		case ElementType.air :
			break ;
		
		default :
			damageDict[ eT ] += amt ;
			break ;
		}
	}


	void LateUpdate()
	{
		float dmg = 0 ;

		foreach ( KeyValuePair< ElementType , float > entry in damageDict )		{
			dmg += entry.Value;													}

		if ( dmg > 0 )
		{
			if (characterTrans.localScale == Vector3.one)
			{
				damageScaleStartTime = Time.time ;

				// GetComponent< AudioSource >().clip = hurt ;
				// GetComponent< AudioSource >().Play() ;

				if ( Time.time >= nextSoundTime ) 
				{
					GetComponent< AudioSource >().PlayOneShot( hurt ) ;

					nextSoundTime = Time.time + hurt.length ;
				}
			}
		}
		
		float damU = ( Time.time - damageScaleStartTime ) / damageScaleDuration ;
		damU = Mathf.Min( 1 , damU ) ;

		float scl = ( 1 - damU ) * damageScale + damU * 1 ;
		characterTrans.localScale = scl * Vector3.one ;

		health -= dmg ;
		health = Mathf.Min( _maxHealth , health ) ;
		
		if ( health <= 0 )		{
			Die() ;				}
	}


	public void Die()				{
		Destroy ( gameObject ) ;	}
}