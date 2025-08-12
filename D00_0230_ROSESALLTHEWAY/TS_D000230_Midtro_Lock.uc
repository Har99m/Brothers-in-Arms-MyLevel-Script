//=============================================================================
// TS_D000230_Midtro_Lock.
//=============================================================================
class TS_D000230_Midtro_Lock extends TriggeredScript
	placeable;

State Triggered
	{
		Begin:
			//===== LOCK
				ACTION_LimitPlayerInput( GetLocalPlayerController(), true ); 
				ACTION_LockPlayerMovement( GetLocalPlayerPawn() );

			//===== WAIT
				ACTION_WaitForEvent( 'Event_Midtro_Unlock' );

			//===== UN-LOCK
				ACTION_LimitPlayerInput( GetLocalPlayerController(), false ); 
				ACTION_UnLockPlayerMovement( GetLocalPlayerPawn() );
				GetLocalPlayerPawn().SwitchToLastWeapon();

		ScriptEnd:
	}
