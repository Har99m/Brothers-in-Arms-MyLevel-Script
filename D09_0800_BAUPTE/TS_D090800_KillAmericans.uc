//=============================================================================
// TS_D090800_KillAmericans.
//=============================================================================
class TS_D090800_KillAmericans extends TriggeredScript
	placeable;

state Triggered
{
	function OnTrigger()
	{
		// Trigger Once
	}

	Begin:

	sleep( 1.5 );

	ACTION_DestroyActor( 'Intro_Tank' );
	ACTION_DestroyActor( 'AP_Paddock' );
	ACTION_DestroyActor( 'AP_Friar' );
	ACTION_DestroyActor( 'AP_Marsh' );

	ACTION_DestroyActor( 'TP_Outro' );
	ACTION_DestroyActor( 'AP_Doyle_Outro' );
	ACTION_DestroyActor( 'AP_us1_Outro' );

	ScriptEnd:
}
