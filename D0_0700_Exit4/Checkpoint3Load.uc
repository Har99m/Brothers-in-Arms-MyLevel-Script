//=============================================================================
// Checkpoint3Load.
//=============================================================================
class Checkpoint3Load extends TriggeredScript
	placeable;


state Triggered
{
begin:

	ACTION_SetObjectiveStatus( 0, OI_Active, 'ObjectiveList' );
	ACTION_DisplayObjective( 0, 'ObjectiveList', 4.0 ); 

	ACTION_TriggerEvent( 'ObjectiveBeacon' );
	ACTION_SetObjectiveBeaconState( 'ObjectiveBeacon', false, true, true );



	ACTION_FadeOverlay( GetLocalPlayerController(), 2, 6.0 );
	ACTION_TriggerEvent( 'Hartsock_Checkpoint3' );
	ACTION_TriggerEvent( 'SpawnAllenandGarnett_Checkpoint3' );

	TS_Waypoint_Manager(getFirstActor('TS_Waypoint_Manager')).Current_Waypoint = 'Waypoint_AandG';
	TS_Waypoint_Manager(getFirstActor('TS_Waypoint_Manager')).Waypoint_to_Set = 'Waypoint_AandG';

	ACTION_TriggerEvent( 'TS_Waypoint_Manager' );
	ACTION_TriggerEvent( 'Waypoint_AandG' );

	ACTION_TriggerEvent( 'Checkpoint3Script' );

	ACTION_DestroyActor( 'G01' );
	ACTION_DestroyActor( 'G02' );
	ACTION_DestroyActor( 'trigger_Checkpoint2SaveScript' );
	ACTION_DestroyActor( 'Trigger_Combat2Script' );
	ACTION_DestroyActor( 'trigger_MortarObjective' );
	ACTION_DestroyActor( 'trigger_RightScript' );
	ACTION_DestroyActor( 'trigger_BeaconMortarScript' );
	ACTION_DestroyActor( 'trigger_MortarADismount' );
	ACTION_DestroyActor( 'Trigger_Combat3Script' );
	ACTION_DestroyActor( 'trigger_RoadExplosions' );
	ACTION_DestroyActor( 'trigger_AllenandGarnett' );
	ACTION_DestroyActor( 'trigger_AllenandGarnettOrder' );
}

