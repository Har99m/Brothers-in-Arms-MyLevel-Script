//=============================================================================
// MoveFromBarnScript.
//=============================================================================
class MoveFromBarnScript extends TriggeredScript
	placeable;

state Triggered
	{
	Begin:

	ACTION_OrderMove( 'GermanSquad04', 'GermanSquad04_Path04' );

	ScriptEnd:
	}
