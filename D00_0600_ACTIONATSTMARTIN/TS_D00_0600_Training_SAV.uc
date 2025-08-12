//=============================================================================
// TS_D00_0600_Training_SAV.
// Train player to use SAV for combat (because no one ever it, ever)
// If player has pressed SAV key, break out of loop
//=============================================================================
class TS_D00_0600_Training_SAV extends TriggeredScript
	placeable;

State Triggered
	{
		Begin:

			if ( !ACTION_IsTrainingDisabled() )
				{
					ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_A" ), 4.0 );

						//-----TRAINING_A="Remember to %action_sa_view% %icon_sa_view% at any time to bring up Situational Awareness Mode when you want to pause the game and plan tactics."
				}

					sleep( 60.0 );

			if ( !ACTION_IsTrainingDisabled() )
				{
					ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_A" ), 4.0 );

						//-----TRAINING_A="Remember to %action_sa_view% %icon_sa_view% at any time to bring up Situational Awareness Mode when you want to pause the game and plan tactics."
				}

					sleep( 60.0 );

			if ( !ACTION_IsTrainingDisabled() )
				{
					ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_A" ), 4.0 );

						//-----TRAINING_A="Remember to %action_sa_view% %icon_sa_view% at any time to bring up Situational Awareness Mode when you want to pause the game and plan tactics."
				}

		ScriptEnd:
	}

State Exit_Loop
	{
		Begin:

			//===== Don't do anything
				ACTION_DisplayTrainingMessage( "" , 0.0 );

		ScriptEnd:
	}
