//=============================================================================
// TS_D00_1630_Hint01Script.
//=============================================================================
class TS_D00_1630_Hint01Script extends TriggeredScript
	placeable;

state Triggered
{
	Begin:

	ACTION_DisplayObjectiveHint( S_Localize( "HINT_1" ), 4.0 );

}
