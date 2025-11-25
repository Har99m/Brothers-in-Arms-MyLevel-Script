//=============================================================================
// Combat1Script.
//=============================================================================
class Combat1Script extends TriggeredScript
	placeable;

var int BellRing;
var Actor ChurchTower;

state Triggered
{
	function OnTrigger()
	{
		Log( name $ "<" $ GetStateName() $ ">.OnTrigger() called.", 'TriggeredScript' );
		GotoState( 'Trigger2' );
	}
Begin:

	ACTION_DestroyActor( 'trigger_Combat1Script' );
	ACTION_OrderMove( 'GermanSquad01c', 'C1_BarrelBlockadeRear' );
	ACTION_OrderMove( 'GermanSquad01d', 'C1_BarrelBlockadeFront' );

	ACTION_TriggerEvent( 'Waypoint_ChurchArea' );
	ACTION_SetObjectiveBeaconState( 'Waypoint_ChurchArea', false, false, true );
	ACTION_TriggerEvent( 'Waypoint_RoadBlock2' );

ScriptEnd:
}

state Trigger2
{
	function OnTrigger()
	{
		Log( name $ "<" $ GetStateName() $ ">.OnTrigger() called.", 'TriggeredScript' );
		GotoState( 'Trigger3' );
	}
Begin:

	ACTION_DestroyActor( 'Combat1Script_trigger' );
	ACTION_TriggerEvent( 'SpawnGermanSquad01' );
	ACTION_OrderTarget( 'GermanSquad01c', 'PlayerUnit' );
	sleep( 0.2 );
	ACTION_OrderMove( 'GermanSquad01', 'C1_1stHouse' );
	ACTION_OrderMove( 'GermanSquad01e', 'C1_1stHouse2' );
	ACTION_TriggerEvent( 'SpawnGermanSquad01b' );
	sleep( 0.2 );
	ACTION_OrderMove( 'GermanSquad01b', 'C1_BackYard' );

	ACTION_TriggerEvent( 'Combat1SI' );

ScriptEnd:
}

state Trigger3
{
Begin:

	ACTION_EnableMG42Recruiting( 'MG42_RoadBlock1', true );
	ACTION_DestroyActor( 'Combat1Script_trigger2' );
	ACTION_AssigntoUnit( 'GermanSquad01e_1', 'GermanSquad01');
	sleep( 0.2 );
	ACTION_OrderMove( 'GermanSquad01', 'C1_MidYard' );
	ACTION_TriggerEvent( 'SpawnGermanSquad02' );
	sleep( 0.2 );
	ACTION_OrderMove( 'GermanSquad02', 'MG_RB1_Gunner' );
	ACTION_OrderTarget( 'GermanSquad02', 'PlayerUnit' );

	ACTION_WaitForEvent( 'Combat1Script_Save' );
	ACTION_DestroyActor( 'Combat1Script_triggersave' );
	ACTION_DestroyActor( 'Trigger_KillPlayerScript' );
	ACTION_DestroyActor( 'SpawnGermanSquad01' );
	ACTION_DestroyActor( 'GermanSquad01' );
	ACTION_DestroyActor( 'GermanSquad01e_1' );
	ACTION_DestroyActor( 'SpawnGermanSquad01b' );
	ACTION_DestroyActor( 'GermanSquad01b' );

	ACTION_SaveMemoryReport( "foucarville_checkpoint1_before" );
	ACTION_CheckPointSave( 2 );
	ACTION_SaveMemoryReport( "foucarville_checkpoint1_after" );
}
