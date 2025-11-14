//=============================================================================
// CheckPointReload2Script.
//=============================================================================
class CheckPointReload2Script extends TriggeredScript
	placeable;

state Triggered
{
	Begin:
	Sleep( 0.1 );

	ACTION_EnableMG42Recruiting( 'MG42_RoadBlock1', true );

	//STUFF TO DELETE FROM SCRIPT1
	ACTION_DestroyActor( 'Trigger_KillPlayerScript' );
	ACTION_DestroyActor( 'Waypoint_RoadBlock2' );
	ACTION_DestroyActor( 'Combat1Script_triggersave' );
	ACTION_DestroyActor( 'trigger_Combat1Script' );
	ACTION_DestroyActor( 'Combat1Script_trigger' );
	ACTION_DestroyActor( 'Combat1Script_trigger2' );
	ACTION_SetHidden( 'fencedestroyed' , true );
	ACTION_DestroyActor( 'Combat2Script_trigger2' );
	ACTION_DestroyActor( 'Crow2' );
	ACTION_DestroyActor( 'Crow1' );

	// Spawn Hartsock, Garnett, Allen
	ACTION_TriggerEvent( 'CP2_SpawnUSSquad' );
	ACTION_TriggerEvent( 'SpawnGermanSquad02' );
	ACTION_BlockNavPoints( 'PN_Fence_Road' );
	ACTION_BlockNavPoints( 'PN_Fence_Field' );

	ACTION_SetObjectiveStatus( 0, OI_Active, 'ObjectiveList_FV' );
	ACTION_DisplayObjective( 0, 'ObjectiveList_FV', 4.0 );
	ACTION_DisplayObjectiveHint(S_Localize("HINT_1", "D0_1500_FOUCARVILLE" ), 3.0 );
	ACTION_TriggerEvent( 'Waypoint_MG42_RB2' );

	ACTION_SaveMemoryReport( "foucarville_checkpoint1_after" );
	ACTION_FadeOverlay( GetLocalPlayerController(), 2, 6.0 );
	ACTION_TriggerEvent( 'Combat2Script' );

EndScript:
}
