//=============================================================================
// RightScript.
//=============================================================================
class RightScript extends TriggeredScript
	placeable;

state Triggered
{
Begin:

	SLog( "RightScript running...------------------MOTHERFUCKER WHEE" );	

	ACTION_TriggerEvent( 'SpawnGermanSquad03' );
	ACTION_OrderMove( 'GermanSquad03', 'GermanSquad03_Path01' );

	SLog( "RightScript ended..." );

	ScriptEnd:

}
