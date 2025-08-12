//=============================================================================
// TS_D000230_Training_MG.
//=============================================================================
class TS_D000230_Training_MG extends TriggeredScript
	placeable;

State Triggered
	{
		Begin:

			if ( !ACTION_IsTrainingDisabled() )
				{
					//-----/-----HINT_C="Machine guns can never be suppressed.  Avoid their field of fire and attack them from the flank."
						ACTION_DisplayObjectiveHint( S_Localize( "HINT_C" ), 4.0 );
							sleep( 4.2 );
						ACTION_DisplayObjectiveHint( "" , 0.0 );
				}

		ScriptEnd:
	}
