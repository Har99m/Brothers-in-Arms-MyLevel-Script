//=============================================================================
// TS_D000230_IntroRide.
//=============================================================================
class TS_D000230_IntroRide extends TriggeredScript
	placeable;

var AnimPawn AP_Hartsock , AP_Doyle ;
var ActorLite PN_Temp ;

state Triggered

	{
		Begin:

				//===== Define variables
					GetLocalPlayerPawn().bHidden = True;
					AP_Hartsock = AnimPawn( GetPawn( 'AP_Intro_Hartsock_Tree' ));

			//===== START ANIMATION RIDE 
				ACTION_TriggerEvent( 'Scene_D00_0230_Intro_Dummy' );
				ACTION_CameraInPawnHead( 'AP_Intro_Hartsock_Tree' , 'Scene_D00_0230_Intro_Dummy' , TRUE );
				ACTION_TriggerEvent( 'Event_SS_Intro_Ride_Setup' );

				//===== Wait for player to start drop to sync knife sound
					ACTION_WaitForEvent( 'Event_Intro_Hartsock_Drop' );
						sleep( 1.6 );
					ACTION_PlaySound( 'AP_Intro_Hartsock_Tree' , "PLAYER.KNIFE_CUT_ROPE" , 1.0 , 1.0 , 1024 );

				//===== Wait for event 
					ACTION_WaitForEvent( 'Event_Intro_Finish_Ride' );

			//===== END ANIMATION RIDE
				AP_Hartsock.bHidden = TRUE ;
				GetLocalPlayerPawn().bHidden = False;

				ACTION_PlayerToCameraPawn( 'AP_Intro_Hartsock_Tree' );
				ACTION_CameraInPawnHead( 'AP_Intro_Hartsock_Tree' , 'Scene_D00_0230_Intro_Dummy' , FALSE );
				ACTION_StopScene( 'Scene_D00_0230_Intro_Dummy' , '' );
				ACTION_BlockActionKeys( KEY_ACTION_SA_VIEW );

		ScriptEnd:
	}
