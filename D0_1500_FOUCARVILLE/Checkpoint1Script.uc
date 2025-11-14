//=============================================================================
// Checkpoint1Script.
//=============================================================================
class Checkpoint1Script extends TriggeredScript
	placeable;

var Actor Combat1SI;

state Triggered
{
Begin:

	Combat1SI = GetfirstActor( 'Combat1SI' );

	if( Combat1SI(Combat1SI).Combat1SIState == RunningState )
		{
		//Complete Objective and Turn Off Objective Beacon
//		ACTION_SetObjectiveStatus( 1, OI_Complete, 'ObjectiveList_FV' );
		ACTION_TriggerEvent( 'Waypoint_RoadBlock2' );
		ACTION_DestroyActor( 'Waypoint_RoadBlock2' );
		sleep( 0.2 );
		//Start Objective and Turn On Objective Beacon
//		ACTION_DisplayObjectiveString( "HINT: Find a way around the machine gun.", 4.0 );
		ACTION_DisplayObjectiveHint(S_Localize("HINT_1", "D0_1500_FOUCARVILLE" ), 3.0 );
		ACTION_TriggerEvent( 'Waypoint_MG42_RB2' );
		Combat1SI.GotoState( 'default' );
		}
	else if( Combat1SI(Combat1SI).Combat1SIState == EndState )
		{
		//Complete Objective and Turn Off Objective Beacon
//		ACTION_SetObjectiveStatus( 1, OI_Complete, 'ObjectiveList_FV' );
//		ACTION_DisplayObjective( 1, 'ObjectiveList_FV', 5.0 );
		ACTION_TriggerEvent( 'Waypoint_RoadBlock2' );
		ACTION_DestroyActor( 'Waypoint_RoadBlock2' );
		sleep( 2.0 );
		//Start Objective and Turn On Objective Beacon
//		ACTION_DisplayObjectiveString( "HINT: Find a way around the machine gun.", 4.0 );
		ACTION_DisplayObjectiveHint(S_Localize("HINT_1", "D0_1500_FOUCARVILLE" ), 3.0 );
		ACTION_TriggerEvent( 'Waypoint_MG42_RB2' );
		}

ScriptEnd:
}
