//=============================================================================
// TS_DisplayHint.
//=============================================================================
class TS_DisplayHint extends TriggeredScript
	placeable;

var(Events) string szLocalizedTag;
var(Events) float fTime;
var(Events) edfindable Unit Unit_CheckAlive;

state Triggered
{
	function OnTrigger()
	{
		// Trigger Once
	}

	Begin:

	if ( szLocalizedTag != "" && (Unit_CheckAlive == None || Unit_CheckAlive.GetNumLivingMembers() > 0) )
		ACTION_DisplayObjectiveHint( S_Localize(szLocalizedTag), fTime );
	else
		ACTION_DisplayObjectiveHint( "", 0.0 ); // Clear

	ScriptEnd:
}
