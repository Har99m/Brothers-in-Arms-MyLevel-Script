//=============================================================================
// TS_D00_0600_Waypoint02Church.
//=============================================================================
class TS_D00_0600_Waypoint02Church extends TriggeredScript
	placeable;

state Triggered
{
	Begin:

	// Turn off
	gbxWaypointBeacon( GetFirstActor( 'GBXWPB_PreChurch02' ) ).bEnabled = False;
	ACTION_DestroyActor( 'GBXWPB_PreChurch02' );

	// Turn on

	gbxWaypointBeacon( GetFirstActor( 'GBXWPB_Church' ) ).bNoDirectionArrow = False;
}
