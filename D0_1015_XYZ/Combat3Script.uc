//=============================================================================
// Combat3Script.
//=============================================================================
class Combat3Script extends TriggeredScript
	placeable;

state Triggered
{
Begin:

	SLog( "Combat3Script running..." );	

	/*
	ACTION_DestroyActor( 'G01' );
	ACTION_DestroyActor( 'G02' );
	ACTION_DestroyActor( 'G03' );
	ACTION_DestroyActor( 'G04' );
	ACTION_DestroyActor( 'G05' );
	ACTION_DestroyActor( 'G06' );
	ACTION_DestroyActor( 'G08' );
	*/

	ACTION_TriggerEvent( 'SpawnGermanSquad07' );
	ACTION_TriggerEvent( 'SpawnGermanSquad08' );
	ACTION_TriggerEvent( 'SpawnGermanSquad09' );
	ACTION_TriggerEvent( 'SpawnGermanSquad10' );
	ACTION_TriggerEvent( 'SpawnGermanSquad11' );
		sleep(0.2);
	ACTION_TriggerEvent( 'SpawnGermanSquad12' );

	ACTION_OrderMove( 'GermanSquad05', 'C2_GermanChase01' );
	ACTION_OrderMove( 'GermanGunner01', 'C2_GermanChase03' );
	ACTION_OrderMove ( 'GermanSquad07', 'GermanSquad07_Path01' );
	ACTION_OrderMove ( 'GermanSquad08', 'GermanSquad08_Path01' );
	ACTION_OrderMove ( 'GermanSquad09', 'GermanSquad09_Path01' );
	ACTION_OrderMove ( 'GermanSquad10', 'LogPileSmall' );
	ACTION_OrderMove ( 'GermanSquad12', 'GermanSquad12_Path01' );
		sleep(2.0);
	ACTION_OrderMove ( 'GermanSquad12', 'GermanSquad12_Path01' );
		sleep(2.0);
	ACTION_OrderMove ( 'GermanSquad12', 'GermanSquad12_Path01' );

	

	ScriptEnd:

}
