//=============================================================================
// TS_D10_0800_CP1_Misc.
//=============================================================================
class TS_D10_0800_CP1_Misc extends TriggeredScript
	placeable;

State Triggered
	{
		Begin:

				ACTION_UnBlockNavPoints( 'PN_Intro_Doyle_Funnel' );
				ACTION_BlockNavPoints( 'PN_Intro_Exit' );

		ScriptEnd:
	}
