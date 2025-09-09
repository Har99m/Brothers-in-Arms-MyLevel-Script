//=============================================================================
// TS_D08_1000_Checkpoint2Reload.
//=============================================================================
class TS_D08_1000_Checkpoint2Reload extends TriggeredScript
	placeable;

state Triggered
	{
	Begin:

	if(	!GbxWaypointBeacon(GetFirstActor('gbxWaypointBeacon_MainObjective')).bEnabled )
		ACTION_TriggerEvent('gbxWaypointBeacon_MainObjective');

	ACTION_SetObjectiveStatus( 0, OI_Active, 'ObjectiveList' );
	ACTION_DisplayObjective( 0, 'ObjectiveList', 4.0 );
	}
