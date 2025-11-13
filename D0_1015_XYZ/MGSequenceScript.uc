//=============================================================================
// MGSequenceScript.
//=============================================================================
class MGSequenceScript extends TriggeredScript
	placeable;

state Triggered
{
Begin:

ACTION_TriggerEvent( 'SpawnMGSequenceSquad' );
ACTION_OrderMove( 'MGSequenceSquad', 'GermanSquad03_Escape', true );

ACTION_WaitForEvent( 'DestroyMGSequenceSquad' );

		sleep(2.0);

	ACTION_DestroyActor( 'MGSequence01' );
	ACTION_DestroyActor( 'MGSequence02' );

ScriptEnd:

}
