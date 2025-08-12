//=============================================================================
// TS_D00_0600_Training_SAV_Check.
// Check if player has gone into SAV , if so , exit other script's state
//=============================================================================
class TS_D00_0600_Training_SAV_Check extends TriggeredScript
	placeable;

var PlayerController LPC ;

State Triggered
	{
		Begin:

			LPC = GetLocalPlayerController();

			ACTION_ClearInterceptedActionKeys();
			ACTION_WaitForInterceptedActionKeys( KEY_ACTION_SA_VIEW );

			if ( LPC.KEY_ACTION_SA_VIEW != 0)  
				{
					GetFirstActor( 'TS_D00_0600_Training_SAV' ).GoToState( 'Exit_Loop' );
				}

			//===== Whut
				ACTION_DisplayTrainingMessage( "" , 0.0 );

		ScriptEnd:
	}
