//=============================================================================
// TS_D02_2300_HintCrate.
//=============================================================================
class TS_D02_2300_HintCrate extends TriggeredScript
	placeable;
State Triggered
{
Begin:
				ACTION_DisplayObjectiveHint( S_Localize( "HINT_D" ) , 5.0 );
						//-----/-----HINT_D="Look for the crate under the arched entrance of the Chateau to find a stash of panzerfausts."
	GotoState('PanzerWait');
}

State PanzerWait
{
	Function OnTrigger()
	{
		
	}
Begin:

}

