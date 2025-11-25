//=============================================================================
// Combat3Script.
//=============================================================================
class Combat3Script extends TriggeredScript
	placeable;

state Triggered
{
	function OnTrigger()
	{
		Log( name $ "<" $ GetStateName() $ ">.OnTrigger() called.", 'TriggeredScript' );
		GotoState( 'ChurchCombat' );
	}
Begin:

	ACTION_DestroyActor( 'Combat3Script_trigger' );
	ACTION_TriggerEvent( 'SpawnGermanSquad03' );
	ACTION_OrderMove( 'GermanSquad03', 'C3_PeanutWest' );
	sleep( 0.2 );

	ACTION_TriggerEvent( 'SpawnGermanSquad03b' );
	ACTION_OrderMove( 'GermanSquad03b', 'C3_PeanutEast' );
	sleep( 0.2 );

	ACTION_TriggerEvent( 'SpawnGermanSquad03c' );
	ACTION_OrderMove( 'GermanSquad03c', 'C3_NorthGraves' );
	sleep( 0.2 );
	ACTION_TriggerEvent( 'SpawnGermanSquad03d' );
	ACTION_OrderMove( 'GermanSquad03d', 'C3_SouthGraves' );
	sleep( 0.2 );

	ACTION_SetObjectiveBeaconState( 'Waypoint_ChurchArea', false, false, true );
	ACTION_TriggerEvent( 'Combat3SI' );
	ACTION_TriggerEvent( 'Combat3BeaconScript' );
	ACTION_TriggerEvent( 'Combat3_FollowBeacon' );

	ACTION_WaitForEvent( 'Combat3ScriptSave' );
	ACTION_DestroyActor( 'Combat3ScriptSave_trigger' );
	ACTION_TriggerEvent( 'Combat4Script_trigger' );
	sleep( 0.2 );
	ACTION_SaveMemoryReport( "foucarville_checkpoint3_before" );
	ACTION_CheckPointSave( 4 );
	ACTION_SaveMemoryReport( "foucarville_checkpoint3_after" );

	ACTION_DestroyActor( 'Combat3Script' );
}
