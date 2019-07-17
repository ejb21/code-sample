using UnityEngine ;
using System.Collections ;


public class WindGroundSpell : PT_MonoBehaviour
{
	public float	duration = 3 ;
	public float	durationVariance = 0.5f ;

	public float	fadeTime = 0.5f ;
	public float	timeStart ;
	public float	damagePerSecond = 15 ;


	void Start ()
	{
		timeStart = Time.time ;
		duration = Random.Range( duration - durationVariance , duration + durationVariance ) ;
	}


	void Update ()
	{
		float u = ( Time.time - timeStart ) / duration ;
		float fadePercent = 1 - ( fadeTime / duration ) ;

		if ( u > fadePercent )
		{
			float u2 = ( u - fadePercent ) / ( 1 - fadePercent ) ;

			Vector3 loc = pos ;
			loc.z = u2 * 2 ;
			pos = loc ;
		}
		
		if ( u > 1 )						{
			Destroy ( gameObject ) ;		}
	}


	void OnTriggerEnter ( Collider other )
	{
		GameObject go = Utils.FindTaggedParent( other.gameObject ) ;

		if ( go == null )				{
			go = other.gameObject ;		}
		
		Utils.tr( "Wind hit" , go.name ) ;
	}


	void OnTriggerStay ( Collider other )
	{
		EnemyBug recipient = other.GetComponent< EnemyBug >() ;

		if ( recipient != null )												{
			recipient.Damage( damagePerSecond , ElementType.air , true ) ;		}
	}

	// TODO: Actually damage the other object
}