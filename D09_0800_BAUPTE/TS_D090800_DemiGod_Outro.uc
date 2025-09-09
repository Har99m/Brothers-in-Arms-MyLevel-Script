//=============================================================================
// TS_D090800_DemiGod_Outro.
//=============================================================================
class TS_D090800_DemiGod_Outro extends TriggeredScript
	placeable;

state Triggered
{
	function OnTrigger()
	{
		// Do nothing
	}

	Begin:

	Pawn(GetFirstActor( 'AP_Doyle_Outro' )).Controller.bDemigod = TRUE;

	ScriptEnd:
}
