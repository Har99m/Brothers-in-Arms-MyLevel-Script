//=============================================================================
// TS_D090800_Hint.
//=============================================================================
class TS_D090800_Hint extends TriggeredScript
	placeable;

var(Events) string szLocalizedTag;
var(Events) float fTime, fSleep;

var(Events) bool bTriggerOnce;

var(Events) edfindable Unit Unit_CheckDead;

var bool bDisplayed;

state Triggered
{
	function OnTrigger()
	{
		if ( !bTriggerOnce || !bDisplayed )
			GoToState( 'Triggered' );
	}

	Begin:

	bDisplayed = FALSE;
	sleep( fSleep );

	if ( Unit_CheckDead == None || Unit_CheckDead != None && Unit_CheckDead.GetNumLivingMembers() > 0 )
	{
		ACTION_DisplayObjectiveHint( S_Localize(szLocalizedTag), fTime );
		bDisplayed = TRUE;

		ACTION_TriggerEvent( Event );
	}

	ScriptEnd:
}
