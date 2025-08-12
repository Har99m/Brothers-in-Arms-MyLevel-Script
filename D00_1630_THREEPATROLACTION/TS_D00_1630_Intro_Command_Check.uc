//=============================================================================
// TS_D00_1630_Intro_Command_Check.
//=============================================================================
class TS_D00_1630_Intro_Command_Check extends TriggeredScript
	placeable;

var PlayerController LPC ;

state Triggered
	{
		Begin:
			//===== Define variables
				LPC = GetLocalPlayerController();

		//		LPC.KEY_ACTION_ORDER = 0 ;
		//		LPC.KEY_ACTION_FALL_OUT = 0 ;
		//		LPC.KEY_ACTION_FALL_IN = 0 ;

				ACTION_ClearInterceptedActionKeys();  					// Clear any previously pressed buttons
				ACTION_WaitForInterceptedActionKeys( KEY_ACTION_ORDER + KEY_ACTION_FALL_OUT + KEY_ACTION_FALL_IN + KEY_ACTION_TEAMSELECT );

 				 	if (LPC.KEY_ACTION_ORDER != 0)  					// User issued and order command?
						{
							getFirstActor( 'TS_D00_1630_IntroScene' ).goToState( 'Command' );
							GoToState( 'Complete' );
						}

					else if (LPC.KEY_ACTION_FALL_OUT != 0)  			// User issued a fall OUT command?
						{
							getFirstActor( 'TS_D00_1630_IntroScene' ).goToState( 'Command' );
							GoToState( 'Complete' );
						}

					else if (LPC.KEY_ACTION_FALL_IN != 0)  				// User issued a fall IN command?
						{
							getFirstActor( 'TS_D00_1630_IntroScene' ).goToState( 'Command' );
							GoToState( 'Complete' );
						}

					else if (LPC.KEY_ACTION_TEAMSELECT != 0)  		// User issued has selected a different team / used fall in
						{
							getFirstActor( 'TS_D00_1630_IntroScene' ).goToState( 'Command' );
							GoToState( 'Complete' );
						}
		ScriptEnd:
	}

state Complete
	{
		Begin:

				ACTION_EnableTalkToMessageForCharacter( 'Allen' );
				ACTION_EnableTalkToMessageForCharacter( 'Doyle' );
				ACTION_EnableTalkToMessageForCharacter( 'Garnett' );
				ACTION_EnableTalkToMessageForCharacter( 'Friar' );
				ACTION_EnableTalkToMessageForCharacter( 'Paddock' );

				ACTION_EnableBattleDialogueForCharacter( 'Allen' );
				ACTION_EnableBattleDialogueForCharacter( 'Doyle' );
				ACTION_EnableBattleDialogueForCharacter( 'Garnett' );
				ACTION_EnableBattleDialogueForCharacter( 'Friar' );
				ACTION_EnableBattleDialogueForCharacter( 'Paddock' );

		ScriptEnd:
	}
