//=============================================================================
// hintJump_script.
//=============================================================================
class hintJump_script extends TriggeredScript
	placeable;

var bool EarlyDeath;

state Triggered
	{
		Begin:

			if ( !ACTION_IsTrainingDisabled() )
				{
					//===== Training to teach the player how to jump
						bWaitForAButton = TRUE;
						ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_B" ), 5.0 );
						ACTION_WaitForButtons( GetLocalPlayerController(), 5.0 );
						ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_B" ), 0.01 );
						bWaitForAButton = FALSE;
				}
	}

