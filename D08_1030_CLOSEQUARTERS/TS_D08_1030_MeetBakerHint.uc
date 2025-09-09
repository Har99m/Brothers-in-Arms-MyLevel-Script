//=============================================================================
// TS_D08_1030_MeetBakerHint.
//=============================================================================
class TS_D08_1030_MeetBakerHint extends TriggeredScript
	placeable;

state Triggered
	{
	Begin:

	Loop:

	ACTION_DisplayObjectiveHint(S_Localize("HINT_B" ), 3.5 );
		sleep(25);
	goTo('Loop');

	}

state Null
	{
	Begin:

	}
