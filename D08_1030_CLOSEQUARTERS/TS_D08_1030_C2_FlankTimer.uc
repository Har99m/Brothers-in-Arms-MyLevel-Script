//=============================================================================
// TS_D08_1030_C2_FlankTimer.
//=============================================================================
class TS_D08_1030_C2_FlankTimer extends TriggeredScript
	placeable;

state Triggered
	{
    function OnTrigger()
    {
		GotoState( 'AbortFlank' );
    }
	Begin:

	sleep(11);

	ACTION_OrderMove('UNIT_DE_C201','PN_C2_RightFlank');
		sleep(3.0);
	ACTION_OrderMove('UNIT_DE_C201','PN_C2_RightFlank');
		sleep(3.0);


	StateEnd:
	}

state AbortFlank
	{
	Begin:

	SLog("NULL");
	ACTION_OrderTarget('UNIT_DE_C201','PlayerUnit');

	ScriptEnd:
	}
