//=============================================================================
// TS_D09_1500_FirstHedgeHint.
//=============================================================================
class TS_D09_1500_FirstHedgeHint extends TriggeredScript
	placeable;

state Triggered
{
	function OnTrigger()
	{
		GoToState( 'Complete' );
	}

	Begin:

	sleep( 30.0 );

	do
	{
		sleep( 30.0 );
		ACTION_DisplayObjectiveHint( S_Localize("HINT_C"), 4.0 );
	} until ( FALSE );
}

state Complete
{
	function OnTrigger()
	{
		// Trigger Once
	}

	Begin:

	ACTION_DisplayObjectiveHint( "", 0.0 );

	ScriptEnd:
}
