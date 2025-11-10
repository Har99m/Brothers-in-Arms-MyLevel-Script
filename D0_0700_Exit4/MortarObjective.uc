//=============================================================================
// MortarObjective.
//=============================================================================
class MortarObjective extends TriggeredScript
	placeable;


state Triggered
{
Begin:

	SLog( "MortarObjective initiated..." );

	//cleans up bodies from the Combat one

	if ((GetPawn('G03').Health > 0) || (GetPawn('G04').Health > 0))
	{
		if (GetPawn('Hartsock').Health > 0 )
		{
	//	HINT_2 "Order Hartsock to fire on the German unit."
		ACTION_DisplayObjectiveHint(S_Localize("HINT_2", "D0_0700_EXIT4" ), 6.0  );
		sleep(6.0);
		}

//	HINT_3 "Use Situational Awareness View to find a flank."
	ACTION_DisplayObjectiveHint(S_Localize("HINT_3", "D0_0700_EXIT4" ), 6.0 );
	sleep(4.0);
	}

	SLog( "MortarObjective ended..." );
	
	ScriptEnd:

}
