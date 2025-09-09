//=============================================================================
// TS_TogglePaths.
//=============================================================================
class TS_TogglePaths extends TriggeredScript
	placeable;

var(Events) bool bToggleOn;

state Triggered
{
	Begin:

	if ( bToggleOn )
	{
		bToggleOn = FALSE;
		ACTION_UnblockNavPoints( Event );
	}
	else
	{
		bToggleOn = TRUE;
		ACTION_BlockNavPoints( Event );
	}

	ScriptEnd:
}
