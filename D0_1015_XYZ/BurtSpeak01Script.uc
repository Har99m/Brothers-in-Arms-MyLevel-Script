//=============================================================================
// BurtSpeak01Script.
//=============================================================================
class BurtSpeak01Script extends TriggeredScript
	placeable;


state Triggered
	{
	Begin:

	ACTION_TriggerEvent( 'SpawnGermanSquad03' );
	ACTION_OrderMove( 'GermanSquad03', 'GermanSquad03_Path01' );
	ACTION_OrderMove( 'GermanSquad01', 'GermanSquad01_Path03' );

	ScriptEnd:
	}
