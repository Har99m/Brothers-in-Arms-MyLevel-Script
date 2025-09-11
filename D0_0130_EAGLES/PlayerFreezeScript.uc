//=============================================================================
// PlayerFreezeScript.
//=============================================================================
class PlayerFreezeScript extends TriggeredScript
	placeable;

State Triggered
	{
		Begin:

		 		ACTION_HideHUD ( GetLocalPlayerController() , true);
				ACTION_LimitPlayerInput( GetLocalPlayerController(), true ); 
				ACTION_LockPlayerMovement( GetLocalPlayerPawn() );
				//ACTION_BlockActionKeys( KEY_ACTION_CROUCH + KEY_ACTION_USE + KEY_ACTION_LOOK );
				ACTION_TriggerEvent ('EaglesEndScript');

				ACTION_BlockNavPoints( 'PN_WallJump' );

	}
