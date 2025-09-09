//=============================================================================
// TS_D07_1500_FlipWaypoints.
//=============================================================================
class TS_D07_1500_FlipWaypoints extends TriggeredScript
	placeable;

state Triggered
{
	Begin:

	//Unblock nodes
	ACTION_UnBlockNavPoints( 'PN_CP2_Blocked' );

	ACTION_TriggerEvent( 'Beacon_BeforeRoad' );

	gbxWaypointBeacon( GetFirstActor( 'Beacon_BeforeRoad' ) ).bEnabled = false;
	gbxWaypointBeacon( GetFirstActor( 'Beacon_BeforeRoad' ) ).bNoDirectionArrow = false;

	gbxWaypointBeacon( GetFirstActor( 'Beacon_Road' ) ).bEnabled = true;
	gbxWaypointBeacon( GetFirstActor( 'Beacon_Road' ) ).bNoDirectionArrow = false;
	gbxWaypointBeacon( GetFirstActor( 'Beacon_Road' ) ).bNoDistanceArc = false;
}
