//=============================================================================
// PlayerLeft02Script.
//=============================================================================
class PlayerLeft02Script extends TriggeredScript
	placeable;

state Triggered
{
Begin:

ACTION_OrderMove( 'GermanSquad09', 'GermanSquad09_Path02' );
ACTION_OrderMove( 'GermanSquad08', 'GermanSquad08_Path02' );

ScriptEnd:
}
