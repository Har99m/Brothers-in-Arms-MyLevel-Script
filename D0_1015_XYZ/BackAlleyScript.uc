//=============================================================================
// BackAlleyScript.
//=============================================================================
class BackAlleyScript extends TriggeredScript
	placeable;

state Triggered
{
begin:

	ACTION_DestroyActor( 'G10' );	
	ACTION_DestroyActor( 'G13' );
	ACTION_DestroyActor( 'MGGunner01' );
	ACTION_DestroyActor( 'G07' );
	ACTION_DestroyActor( 'EG01' );

	ACTION_TriggerEvent( 'Crow2Script');
	ACTION_TriggerEvent( 'SpawnGermanSquad11' );
	ACTION_TriggerEvent( 'SpawnGermanSquad11b' );
	ACTION_OrderMove( 'GermanSquad09', 'GermanChase01' );
	ACTION_OrderMove( 'GermanSquad10', 'GermanChase01' );
		sleep(10.0);
	ACTION_OrderMove( 'GermanSquad11', 'GermanSquad11_Path01' );

	sleep (10.0);

	ACTION_TriggerEvent( 'SpawnGermanSquad12a' );
	ACTION_TriggerEvent( 'SpawnGermanSquad13' );
	ACTION_TriggerEvent( 'Combat4SI' );

	ACTION_OrderMove( 'GermanSquad12', 'GermanSquad12_Stage' );
	ACTION_OrderMove( 'GermanSquad13', 'GermanSquad13_Stage' );

	ACTION_TriggerEvent( 'SpawnGermanSquad11b' );
	ACTION_OrderMove( 'GermanSquad11b', 'GermanSquad11_Path01' );
	ACTION_OrderMove( 'GermanSquad11', 'GermanSquad11_Path03' );

ScriptEnd:

}
