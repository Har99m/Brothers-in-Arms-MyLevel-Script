//=============================================================================
// TS_SetTurretDestroyed.
//=============================================================================
class TS_SetTurretDestroyed extends TriggeredScript
	placeable;

state Triggered
{
	function OnTrigger()
	{
		// Trigger Once
	}

	Begin:

	ACTION_SetTurretDestroyed( Event );

	ScriptEnd:
}

