//=============================================================================
// SpawnGermanSquad01Script.
//=============================================================================
class SpawnGermanSquad01Script extends TriggeredScript
	placeable;

state Triggered
	{
	Begin:

	ACTION_TriggerEvent( 'SpawnGermanSquad01' );
	ACTION_OrderMove( 'GermanSquad01', 'GermanSquad01_Path01' );

	ScriptEnd:
	}