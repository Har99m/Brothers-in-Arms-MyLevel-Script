//=============================================================================
// TS_D00_1630_JustInCaseGuys.
//=============================================================================
class TS_D00_1630_JustInCaseGuys extends TriggeredScript
	placeable;

var bool bSquad3HasDied;

state Default
{
	Begin:

	bSquad3HasDied = False;

}

state Triggered
{
	Begin:

	bSquad3HasDied = True;

}
