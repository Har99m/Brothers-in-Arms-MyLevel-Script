//=============================================================================
// PlayerLeftScript.
//=============================================================================
class PlayerLeftScript extends TriggeredScript
	placeable;

state Triggered
{
begin:

	ACTION_OrderMove( 'GermanSquad12', 'GermanSquad08_Path01' );
	ACTION_OrderMove( 'GermanSquad10', 'GermanSquad12_Path03' );
	ACTION_OrderMove( 'GermanSquad09', 'GermanSquad09_Path01' );
	ACTION_DestroyActor( 'trigger_PlayerBack02Script' );
	ACTION_DestroyActor( 'PlayerBack02Script' );

	ScriptEnd:

}
