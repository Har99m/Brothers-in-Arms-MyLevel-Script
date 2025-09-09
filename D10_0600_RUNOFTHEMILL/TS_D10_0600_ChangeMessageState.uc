//=============================================================================
// TS_D10_0600_ChangeMessageState.
//=============================================================================
class TS_D10_0600_ChangeMessageState extends TriggeredScript
	placeable;

var(Events) gbxMessageSI gbxMSI_Change;
var(Events) int numNewState;

var int i;

state Triggered
{
	function OnTrigger()
	{
		// Trigger Once
	}

	Begin:

	if ( gbxMSI_Change != None )
	{
		for ( i = 0; i < gbxMSI_Change.m_GermanUnits.Length; i++ )
		{
			gbxMSI_Change.m_GermanUnits[i].numStage = numNewState;
		}
	}

	ScriptEnd:
}
