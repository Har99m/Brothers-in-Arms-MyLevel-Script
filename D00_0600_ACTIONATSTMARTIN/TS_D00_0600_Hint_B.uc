//=============================================================================
// TS_D00_0600_Hint_B.
// Use: Displays hint about moving around church
//=============================================================================
class TS_D00_0600_Hint_B extends TriggeredScript
	placeable;

state triggered
	{
		Begin:

				ACTION_DisplayObjectiveHint( S_Localize( "HINT_2" ) , 4.0 );
					//-----/-----HINT_2="Keep moving around the church until you find an entrance."

					sleep( 5.0 );

		ScriptEnd:
	}
