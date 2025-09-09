//=============================================================================
// TS_D10_0600_Midtro1Scene_Player.
//=============================================================================
class TS_D10_0600_Midtro1Scene_Player extends TriggeredScript
	placeable;


State Triggered
{
	function OnTrigger()
	{
	}

	Begin:

	ACTION_LockPlayerMovement( GetLocalPlayerPawn() );
	ACTION_LimitPlayerInput( GetLocalPlayerController(), TRUE );

	ACTION_OrderFallOut( 'Unit_US_Ass' );
	ACTION_OrderFallOut( 'Unit_US_Tank' );

	ACTION_OrderMove( 'Unit_US_Ass', 'PN_SetupCheckpoint2_02' );
	ACTION_OrderMove( 'Unit_US_Tank', 'PN_SetupCheckpoint2_02' );
}
