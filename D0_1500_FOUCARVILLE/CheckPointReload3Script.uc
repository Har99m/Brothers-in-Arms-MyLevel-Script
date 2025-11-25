//=============================================================================
// CheckPointReload3Script.
//=============================================================================
class CheckPointReload3Script extends TriggeredScript
	placeable;

state Triggered
{
	Begin:
	Sleep( 0.1 );

	//STUFF TO DELETE FROM SCRIPT1
	ACTION_DestroyActor( 'Trigger_KillPlayerScript' );
	ACTION_DestroyActor( 'Waypoint_RoadBlock2' );
	ACTION_DestroyActor( 'Combat1Script_triggersave' );
	ACTION_DestroyActor( 'trigger_Combat1Script' );
	ACTION_DestroyActor( 'Combat1Script_trigger' );
	ACTION_DestroyActor( 'Combat1Script_trigger2' );
	ACTION_SetHidden( 'fencedestroyed' , true );
	ACTION_DestroyActor( 'Crow2' );
	ACTION_DestroyActor( 'Crow1' );

	//STUFF TO DELETE FROM SCRIPT2
	ACTION_DestroyActor( 'Combat2Script_trigger2' );
	ACTION_DestroyActor( 'Waypoint_MG42_RB2' );
	ACTION_DestroyActor( 'Combat2SaveState_triggerEnd' );

	ACTION_BlockNavPoints( 'PN_Fence_Road' );
	ACTION_BlockNavPoints( 'PN_Fence_Field' );

	// Spawn Hartsock, Garnett, Allen
	ACTION_TriggerEvent( 'CP3_SpawnUSSquad' );

	ACTION_SetObjectiveStatus( 0, OI_Active, 'ObjectiveList_FV' );
	ACTION_DisplayObjective( 0, 'ObjectiveList_FV', 4.0 );
	ACTION_SetObjectiveBeaconState( 'Waypoint_ChurchArea', true, true, true );
	ACTION_TriggerEvent( 'Waypoint_ChurchArea' );

	ACTION_SaveMemoryReport( "foucarville_checkpoint3_after" );
	ACTION_FadeOverlay( GetLocalPlayerController(), 2, 6.0 );

EndScript:
}
