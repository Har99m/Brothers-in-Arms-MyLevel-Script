//=============================================================================
// TS_D000230_Training_Reload_Check.
//=============================================================================
class TS_D000230_Training_Reload_Check extends TriggeredScript
	placeable;

var PlayerController LPC ;

State Triggered
	{
		Begin:

			LPC = GetLocalPlayerController();

			ACTION_ClearInterceptedActionKeys();
			ACTION_WaitForInterceptedActionKeys( KEY_ACTION_RELOAD );

			if ( LPC.KEY_ACTION_RELOAD != 0)  
				{
					GetFirstActor( 'TS_D000230_Training_Reload' ).GoToState( 'Safely_Exit' );
				}

			//===== Whut
				ACTION_DisplayTrainingMessage( "" , 0.0 );

		ScriptEnd:
	}


