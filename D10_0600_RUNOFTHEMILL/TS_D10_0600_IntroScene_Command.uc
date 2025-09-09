//=============================================================================
// TS_D10_0600_IntroScene_Command.
//=============================================================================
class TS_D10_0600_IntroScene_Command extends TriggeredScript
	placeable;

state Triggered
{
	function OnTrigger()
	{
	}

	Begin:

	ACTION_ClearInterceptedActionKeys();
	ACTION_WaitForInterceptedActionKeys( KEY_ACTION_ORDER + KEY_ACTION_FALL_OUT + KEY_ACTION_FALL_IN + KEY_ACTION_TEAMSELECT, , , TRUE );

	ACTION_TriggerEvent( Event );

	ScriptEnd:
}
