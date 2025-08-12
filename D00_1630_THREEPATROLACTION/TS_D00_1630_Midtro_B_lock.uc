//=============================================================================
// TS_D00_1630_Midtro_B_lock.
//=============================================================================
class TS_D00_1630_Midtro_B_lock extends TriggeredScript
	placeable;

state triggered
	{
		Begin:

			//===== Lock the player
				ACTION_LimitPlayerInput( GetLocalPlayerController(), TRUE ); 
				ACTION_LockPlayerMovement( GetLocalPlayerPawn() );

				ACTION_SetRepelBulletsDirect( GetLocalPlayerPawn() , TRUE );

				ACTION_TriggerEvent( 'Event_Midtro_Corrion_Found' );

		ScriptEnd:
	}
