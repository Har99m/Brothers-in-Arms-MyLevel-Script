//=============================================================================
// TS_D00_1630_Training_Toggle.
//=============================================================================
class TS_D00_1630_Training_Toggle extends TriggeredScript
	placeable;

var PlayerController LPC ;
var bool bSwitchTeams , bSwitchTeamsBack ;

State Triggered
	{
		Begin:

				LPC = GetLocalPlayerController();

			//=====Wait for input
				ACTION_ClearInterceptedActionKeys();  					// Clear any previously pressed buttons
				ACTION_WaitForXboxInterceptedButton( KEY_ACTION_TEAMSELECT + KEY_ACTION_FIRE_TEAM + KEY_ACTION_ASSAULT_TEAM );

 				 	if ( LPC.KEY_ACTION_FIRE_TEAM != 0)  					// User issued and order command?
						{
							bSwitchTeams = TRUE ;
							GoToState( 'Training_Two' );
						}

 				 	Else if ( LPC.KEY_ACTION_ASSAULT_TEAM != 0)  			// User issued and order command?
						{
							bSwitchTeams = TRUE ;
							GoToState( 'Training_Two' );
						}

 				 	Else if ( LPC.KEY_ACTION_TEAMSELECT != 0)  			// User issued and order command?
						{
							bSwitchTeams = TRUE ;
							GoToState( 'Training_Two' );
						}

		ScriptEnd:
	}

State Training_Two
	{
		Begin:

			//=====
				ACTION_ClearInterceptedActionKeys();  					// Clear any previously pressed buttons
				ACTION_WaitForXboxInterceptedButton( KEY_ACTION_TEAMSELECT + KEY_ACTION_FIRE_TEAM + KEY_ACTION_ASSAULT_TEAM );

 				 	if ( LPC.KEY_ACTION_FIRE_TEAM != 0)  					// User issued and order command?
						{
							bSwitchTeamsBack = TRUE ;
							GoToState( 'Complete' );
						}

 				 	Else if ( LPC.KEY_ACTION_ASSAULT_TEAM != 0)  			// User issued and order command?
						{
							bSwitchTeamsBack = TRUE ;
							GoToState( 'Complete' );
						}


 				 	Else if ( LPC.KEY_ACTION_TEAMSELECT != 0)  			// User issued and order command?
						{
							bSwitchTeamsBack = TRUE ;
							GoToState( 'Complete' );
						}

		ScriptEnd:
	}

State Complete
	{
		Begin:

			//===== Nothing sandwich

		ScripEnd:
	}
