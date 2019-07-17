using UnityEngine ;
using System.Collections ;


public class IceGroundSpell : PT_MonoBehaviour
{
	public float	duration = 8 ;
	public float	durationVariance = 1f ;

	public float	fadeTime = 2f ;
	public float	timeStart ;
	public float	damagePerSecond = 7 ;


	void Start()
	{
		timeStart = Time.time ;
		duration = Random.Range( duration - durationVariance , duration + durationVariance ) ;
	}


	void Update()
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
		
		if ( u > 1 )					{ 
			Destroy ( gameObject ) ;	}
	}


	void OnTriggerEnter ( Collider other )
	{
		GameObject go = Utils.FindTaggedParent( other.gameObject ) ;

		if ( go == null )				{
			go = other.gameObject ;		}
		
		Utils.tr( "Ice hit" , go.name ) ;
	}


	void OnTriggerStay ( Collider other )
	{
		EnemyBug recipient = other.GetComponent< EnemyBug >() ;

		if ( recipient != null )													{
			recipient.Damage( damagePerSecond , ElementType.water , true ) ;		}
	}

	// TODO: Actually damage the other object
}