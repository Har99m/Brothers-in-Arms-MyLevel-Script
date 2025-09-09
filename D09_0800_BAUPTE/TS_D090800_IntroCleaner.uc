//=============================================================================
// TS_D090800_IntroCleaner.
//=============================================================================
class TS_D090800_IntroCleaner extends TriggeredScript
	placeable;

State Triggered
{
	function OnTrigger()
	{
		// Trigger Once
	}

	Begin:

	ACTION_DestroyActor('AP_Hartsock_Intro');
	ACTION_DestroyActor('AP_Hartsock_Intro_BODY');
	ACTION_PlayAnimWithQueue( 'AP_Tree', 'fall_baupte', 0.2, 1.0, False, 38, );

	ScriptEnd:
}
