//=============================================================================
// TS_UnHide.
//=============================================================================
class TS_UnHide extends TriggeredScript
	placeable;

var(Events) edfindable Actor A_UnHide;

state Triggered
{
	Begin:

	if ( A_UnHide != None )
	{
		A_UnHide.bHidden = !A_UnHide.bHidden;
	}

	ScriptEnd:
}
