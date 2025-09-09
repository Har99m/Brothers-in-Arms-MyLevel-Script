//=============================================================================
// TS_D10_0600_Midtro1Scene_UnBlock.
//=============================================================================
class TS_D10_0600_Midtro1Scene_UnBlock extends TriggeredScript
	placeable;

State Triggered
{
	function OnTrigger()
	{
		// Trigger Once
	}

	Begin:

	ACTION_UnBlockNavPoints('PN_MIDTRO1_BLOCKED');
	ACTION_DestroyActor('TRIG_MIDTRO1_LOCK');

	ScriptEnd:
}
