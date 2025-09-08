//=============================================================================
// TS_D02_2300_Hints.
//=============================================================================
class TS_D02_2300_Hints extends TriggeredScript
	placeable;

State Triggered
{
Begin:
				ACTION_DisplayObjectiveHint( S_Localize( "HINT_C" ) , 5.0 );
						//-----/-----HINT_C="The Germans behind the crates are armed with panzerfausts, which can damage and kill your tank."
	GotoState('PanzerWait');
}

State PanzerWait
{
	Function OnTrigger()
	{
		
	}
Begin:

}

