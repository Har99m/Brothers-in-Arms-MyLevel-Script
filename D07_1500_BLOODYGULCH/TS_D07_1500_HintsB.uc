//=============================================================================
// TS_D07_1500_HintsB.
//=============================================================================
class TS_D07_1500_HintsB extends TriggeredScript
	placeable;

state Triggered
{
	function OnTrigger()
	{
		GotoState( 'NextHint' );
	}

	Begin:

	gbxWaypointBeacon( GetFirstActor( 'Beacon_Panzerfaust' ) ).bNoDirectionArrow = false;
	gbxWaypointBeacon( GetFirstActor( 'Beacon_Panzerfaust' ) ).bNoDistanceArc = false;

	sleep( 10.0 );
	ACTION_DisplayObjectiveHint( S_Localize("HINT_E" ), 4.0 );

}

state NextHint
{
	Begin:

	ACTION_DisplayObjectiveHint( S_Localize("HINT_G" ), 4.0 );

}
