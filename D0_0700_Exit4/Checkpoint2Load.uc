//=============================================================================
// Checkpoint2Load.
//=============================================================================
class Checkpoint2Load extends TriggeredScript
	placeable;


state Triggered
{
begin:

	ACTION_SetObjectiveStatus( 0, OI_Active, 'ObjectiveList' );
	ACTION_DisplayObjective( 0, 'ObjectiveList', 4.0 ); 

	ACTION_TriggerEvent( 'ObjectiveBeacon' );
	ACTION_SetObjectiveBeaconState( 'ObjectiveBeacon', false, true, true );



	ACTION_FadeOverlay( GetLocalPlayerController(), 2, 6.0 );
	ACTION_TriggerEvent( 'Hartsock_Checkpoint2' );

	TS_Waypoint_Manager(getFirstActor('TS_Waypoint_Manager')).Current_Waypoint = 'Waypoint_Downhill';
	TS_Waypoint_Manager(getFirstActor('TS_Waypoint_Manager')).Waypoint_to_Set = 'Waypoint_Downhill';

	ACTION_TriggerEvent( 'TS_Waypoint_Manager' );
	ACTION_TriggerEvent( 'Waypoint_Downhill' );

	ACTION_OrderMove( 'USAFireTeam1', 'PN_HartsockAtCheckpoint2' );

	ACTION_TriggerEvent( 'Checkpoint2Script' );

	ACTION_DestroyActor( 'G01' );
	ACTION_DestroyActor( 'G02' );
	ACTION_DestroyActor( 'Trigger_Combat2Script' );
	ACTION_DestroyActor( 'trigger_MortarObjective' );
	ACTION_DestroyActor( 'trigger_RightScript' );
	ACTION_DestroyActor( 'trigger_BeaconMortarScript' );
	ACTION_DestroyActor( 'trigger_MortarADismount' );
	ACTION_DestroyActor( 'trigger_Checkpoint2SaveScript' );

}


