//=============================================================================
// TS_UnBlockPaths.
//=============================================================================
class TS_UnBlockPaths extends TriggeredScript
	placeable;

state Triggered
{
	function OnTrigger()
	{
		// Trigger Once
	}

	Begin:

	ACTION_UnBlockNavPoints( Event );

	ScriptEnd:
}
