//=============================================================================
// TS_PleaseFire.
//=============================================================================
class TS_PleaseFire extends TriggeredScript
	placeable;

var bool bSet;

function PostBeginPlay()
{
	bSet = FALSE;
}

state Triggered
{
	function OnTrigger()
	{
	}

	Begin:

	bSet = TRUE;

	ScriptEnd:
}
