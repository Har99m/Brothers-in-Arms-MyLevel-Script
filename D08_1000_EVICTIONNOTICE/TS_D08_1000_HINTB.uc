//=============================================================================
// TS_D08_1000_HINTB.
//=============================================================================
class TS_D08_1000_HINTB extends TriggeredScript
	placeable;

state Triggered
	{
	Begin:

	ACTION_DisplayObjectiveHint(S_Localize("HINT_B"), 4 );

	ACTION_WaitForEvent('TS_UNIT_C204_Dismount');
	ACTION_DisplayObjectiveHint("", 0 );

	}
