//=============================================================================
// TS_D10_0800_Midtro_Ride.
//=============================================================================
class TS_D10_0800_Midtro_Ride extends TriggeredScript
	placeable;

var AnimPawn AP_Hartsock , AP_Paige , AP_Doyle_Alive , AP_Doyle_Explode ;

state Triggered

	{
		Begin:

		//========== LOCK PLAYER
				ACTION_LimitPlayerInput( GetLocalPlayerController(), true ); 
				ACTION_LockPlayerMovement( GetLocalPlayerPawn() );

				//===== Define variables
					GetLocalPlayerPawn().bHidden = True;
					AP_Hartsock = AnimPawn( GetPawn( 'AP_MidtroHartsock_KnockDown' ));
					AP_Doyle_Alive = AnimPawn( GetPawn( 'AP_Midtro_Doyle_Alive' ));
					AP_Doyle_Explode = AnimPawn( GetPawn( 'AP_Midtro_Doyle_Explode' ));

			//===== START ANIMATION RIDE 
				ACTION_TriggerEvent( 'Scene_D10_0800_Explosion_Ride' );
				ACTION_CameraInPawnHead( 'AP_MidtroHartsock_KnockDown' , 'Scene_D10_0800_Explosion_Ride' , TRUE );
				ACTION_TeleportPlayerToActor( 'LT_Midtro_Player_Teleport' );
				
				GetLocalPlayerController().ScriptViewRestriction = rot(2048, 8191, 0);
// ORIGINAL		aPlayer.ScriptViewRestriction = rot(5461, 8191, 0);
				ACTION_UnlockPlayerMovement( GetLocalPlayerPawn() );
				ACTION_LimitPlayerInput( GetLocalPlayerController(), false );

				ACTION_TriggerEvent( 'Event_SS_Midtro_Paige_Explode' );
				AP_Doyle_Alive.bHidden = TRUE ;
				AP_Doyle_Explode.bHidden = FALSE ;




				//===== Wait for event 
					ACTION_WaitForEvent( 'Event_Explosion_Ride_Complete' );

		Slog( "----------*****----------Release the player----------*****----------" );

			//===== END ANIMATION RIDE
				AP_Hartsock.bHidden = TRUE ;
				ACTION_DestroyActor( 'AP_MidtroHartsock_KnockDown' );

				ACTION_PlayerToCameraPawn( 'AP_MidtroHartsock_KnockDown' );
				ACTION_CameraInPawnHead( 'AP_MidtroHartsock_KnockDown' , 'Scene_D10_0800_Explosion_Ride' , FALSE );
				ACTION_StopScene( 'Scene_D10_0800_Explosion_Ride' , '' );
				GetLocalPlayerPawn().bHidden = False;

					sleep( 0.4 );

				ACTION_UnlockPlayerMovement( GetLocalPlayerPawn() );
				ACTION_LimitPlayerInput( GetLocalPlayerController(), false );
				GetLocalPlayerPawn().bHidden = False;

		ScriptEnd:
	}

