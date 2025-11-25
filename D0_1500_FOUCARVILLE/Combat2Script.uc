//=============================================================================
// Combat2Script.
//=============================================================================
class Combat2Script extends TriggeredScript
	placeable;

var Pawn GS2b_1, GS2b_2;
var Actor MGActor;
var WeapDEMG42_ TheMG;
var MG42Factory TheFactory;

state Triggered
{
	function OnTrigger()
	{
		Log( name $ "<" $ GetStateName() $ ">.OnTrigger() called.", 'TriggeredScript' );
		GotoState( 'SecondTriggered' );
	}
Begin:

	ACTION_DestroyActor( 'Combat2Script_trigger2' );
	ACTION_TriggerEvent( 'Checkpoint1Script' );

//	Decrease the First MGs Accuracy Radius
	MGActor = GetFirstActor( 'MG42_RoadBlock1' );
	if ( MGActor.IsA( 'WeapDEMG42_' ) )
	{
	   TheMG = WeapDEMG42_( MGActor );
	}
	else if ( MGActor.IsA( 'MG42Factory' ) )
	{
	   TheFactory = MG42Factory( MGActor );
	   TheMG = WeapDEMG42_( TheFactory.Gun );
	}

	TheMG.Zone1OuterRadius = 3000; 

	ACTION_EnableMG42Recruiting( 'MG42_RoadBlock2', true );
// Put Combat1SI in its end state in case Player Left Behind Germans
	GetFirstActor('Combat1SI').GotoState( 'default' );

	ACTION_TriggerEvent( 'SpawnGermanSquad02b' );
	ACTION_OrderMove( 'GermanSquad02b', 'C2_BackWall' );
	Sleep( 0.2 );
	ACTION_TriggerEvent( 'SpawnGermanSquad02c' );
	ACTION_OrderMove( 'GermanSquad02c', 'C2_GS2c_spot' );
	Sleep( 0.2 );
	ACTION_TriggerEvent( 'SpawnGermanSquad02d' );
	ACTION_OrderMove( 'GermanSquad02d', 'C2_GS2d_Node' );
	Sleep( 0.2 );
	ACTION_TriggerEvent( 'SpawnGermanSquad02e' );
	ACTION_OrderMove( 'GermanSquad02e', 'C2_GS2e_Node' );
	Sleep( 0.2 );

	ACTION_TriggerEvent( 'Combat2SI' );

	ACTION_WaitForEvent( 'Combat2SaveState' );
	ACTION_DestroyActor( 'Combat2SaveState_triggerEnd' );
	ACTION_DestroyActor( 'SpawnGermanSquad01c' );
	ACTION_DestroyActor( 'GermanSquad01c' );
	ACTION_DestroyActor( 'GermanSquad01d_1' );

	ACTION_SaveMemoryReport( "foucarville_checkpoint2_before" );
	ACTION_CheckPointSave( 3 );
	ACTION_SaveMemoryReport( "foucarville_checkpoint2_after" );
}
