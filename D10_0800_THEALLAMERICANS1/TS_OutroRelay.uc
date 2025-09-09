//=============================================================================
// TS_OutroRelay.
//=============================================================================
class TS_OutroRelay extends TriggeredScript
	placeable;

state Triggered
	{
	Begin:

	ACTION_LockPlayerMovement( GetLocalPlayerPawn() );
	ACTION_HideHUD( GetLocalPlayerController(), TRUE );
	ACTION_LimitPlayerInput( GetLocalPlayerController(), TRUE );


		sleep(1.0);
	//ACTION_TriggerEvent('TS_CheckPointSave_End');
	ACTION_TriggerEvent('TriggeredScriptMapComplete');

	}
