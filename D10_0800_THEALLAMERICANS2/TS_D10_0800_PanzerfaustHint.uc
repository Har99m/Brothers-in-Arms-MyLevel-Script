//=============================================================================
// TS_D10_0800_PanzerfaustHint.
//=============================================================================
class TS_D10_0800_PanzerfaustHint extends TriggeredScript
	placeable;

state Triggered
	{
	function OnTrigger()
	{
		GoToState( 'Null' );
	}
	Begin:

		Loop:
				sleep(25);
			ACTION_DisplayObjectiveHint( S_Localize("HINT_A"), 4 );
		goTo('Loop');

	}

state Null
	{
	Begin:

	ACTION_DestroyActor('gbxTrigger_TS_D10_0800_PanzerfaustHint');

	}
