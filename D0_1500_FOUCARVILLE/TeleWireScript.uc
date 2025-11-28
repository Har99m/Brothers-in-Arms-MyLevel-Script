//=============================================================================
// TeleWireScript.
//=============================================================================
class TeleWireScript extends TriggeredScript
	placeable;

var UtilityPole SouthTop, SouthBottom, WestTop, WestBottom, EastTop, EastBottom;

function UtilityPole GetUtilityPole( name actorTag )
{
	local UtilityPole A;

	if( actorTag == '' )
	{
		return None;
	}

	A = UtilityPole( GetCacheActor( actorTag ));

	if( A == None )
	{
		foreach AllActors( class'UtilityPole', A, actorTag )
			break;

		if( A != None )
		{
			// Add to the cache.
			AddActorToCache( A, actorTag );		// TODO what if multiple actors match this tag? We're only caching the first.
		}
	}

	return A;
}

state Triggered
{
Begin:

	SouthBottom = GetUtilityPole( 'SouthBottomWire' );
	SouthTop = GetUtilityPole( 'SouthTopWire' );
	EastBottom = GetUtilityPole( 'EastBottomWire' );
	EastTop = GetUtilityPole( 'EastTopWire' );
	WestBottom = GetUtilityPole( 'WestBottomWire' );
	WestTop = GetUtilityPole( 'WestTopWire' );

	ACTION_TriggerEvent( 'TelephoneWireSnap' );
//	SLog( "" $ SouthTop.Slack );
	SouthTop.Slack[0] = 220.0;
	SouthTop.NumSegments[0] = 35.0;
	SouthBottom.Slack[1] = 165.0;
	SouthBottom.NumSegments[1] = 30.0;
	sleep( 0.75 );
	SouthTop.Slack[0] = 300.0;
	SouthTop.NumSegments[0] = 42.0;
	SouthBottom.Slack[1] = 220.0;
	SouthBottom.NumSegments[1] = 35.0;

ScriptEnd:
}
