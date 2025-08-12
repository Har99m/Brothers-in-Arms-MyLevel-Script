//=============================================================================
// TS_D00_0600_Waypoint01Church.
//=============================================================================
class TS_D00_0600_Waypoint01Church extends TriggeredScript
	placeable;

state Triggered
{
	Begin:

	// Turn off
	gbxWaypointBeacon( GetFirstActor( 'GBXWPB_PreChurch01' ) ).bEnabled = False;
	ACTION_DestroyActor( 'GBXWPB_PreChurch01' );

	// Turn on
	ACTION_TriggerEvent( 'GBXWPB_PreChurch02' );
	gbxWaypointBeacon( GetFirstActor( 'GBXWPB_PreChurch02' ) ).bEnabled = true;

	ACTION_UnBlockNavPoints( 'PN_C2_BlockedNodes' );

}
