//=============================================================================
// Checkpoint1Script.
//=============================================================================
class Checkpoint1Script extends TriggeredScript
	placeable;


state Triggered
{
begin:

	ACTION_SetObjectiveStatus( 0, OI_Active, 'ObjectiveList' );
	ACTION_DisplayObjective( 0, 'ObjectiveList', 4.0 ); 

	ACTION_TriggerEvent( 'ObjectiveBeacon' );
	ACTION_SetObjectiveBeaconState( 'ObjectiveBeacon', false, true, true );

	TS_Waypoint_Manager(getFirstActor('TS_Waypoint_Manager')).Current_Waypoint = 'Waypoint_AfterTraining';
	TS_Waypoint_Manager(getFirstActor('TS_Waypoint_Manager')).Waypoint_to_Set = 'Waypoint_AfterTraining';

	ACTION_TriggerEvent( 'TS_Waypoint_Manager' );
	ACTION_TriggerEvent( 'Waypoint_AfterTraining' );

If (ACTION_IsTrainingDisabled())
{
	sleep(5.0);
}
	ACTION_BlockNavPoint( 'PN_BlockHartsock' );
	ACTION_BlockNavPoint( 'PN_BlockHartsock2' );

}



