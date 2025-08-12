//=============================================================================
// TS_D00_0600_MidtroScene_B.
//=============================================================================
class TS_D00_0600_MidtroScene_B extends TriggeredScript
	placeable;

var int i;
var AnimPawn Campbell , McConnel , Paige ;
var ActorLite PN_Outro_Campbell_Check , PN_Outro_Paige_Check , PN_Outro_McConnel_Check , PN_Outro_Campbell_Approach ;
var Actor LT_Outro_01 , LT_Outro_02 , LT_Outro_03 , LT_Outro_04 , LT_Outro_05 , LT_Outro_06 , LT_Outro_07 , LT_Outro_Center ;

function DestroyAllGrenades()
{
	local gbxGrenade A;

	foreach AllActors( class'gbxGrenade', A )
		A.Destroy();
}

state triggered
	{
		Begin:

		//========== FREEZE PLAYER
				ACTION_LockPlayerMovement( GetLocalPlayerPawn() );
				ACTION_LimitPlayerInput( GetLocalPlayerController(), true );
				ACTION_HideHUD ( GetLocalPlayerController() , true );

				GetLocalPlayerController().bGodMode = TRUE;
				ACTION_EnablePlayerHeavyTrauma( FALSE );
				DestroyAllGrenades();

			//===== Spawn Campbell , Paige , McConnel
				ACTION_TriggerEvent( 'CSU_MidtroCharacters_B' );

			//===== Trigger Outro pawn's individual scripts that wait for events
				ACTION_TriggerEvent( 'TS_D00_0600_Midtro_Scene_B_Paige' );
				ACTION_TriggerEvent( 'TS_D00_0600_Midtro_Scene_B_McConnel' );

					sleep( 0.3 );

			//===== Define variables
				Campbell = AnimPawn( GetPawn( 'Midtro_Campbell' ));
				McConnel = AnimPawn( GetPawn( 'Midtro_McConnel' ));
				Paige = AnimPawn( GetPawn( 'Midtro_Paige' ));

				LT_Outro_01 = GetFirstActor( 'LT_Outro_01' );
				LT_Outro_02 = GetFirstActor( 'LT_Outro_02' );
				LT_Outro_03 = GetFirstActor( 'LT_Outro_03' );
				LT_Outro_04 = GetFirstActor( 'LT_Outro_04' );
				LT_Outro_05 = GetFirstActor( 'LT_Outro_05' );
				LT_Outro_06 = GetFirstActor( 'LT_Outro_06' );
				LT_Outro_07 = GetFirstActor( 'LT_Outro_07' );
				LT_Outro_Center = GetFirstActor( 'LT_Outro_Center' );

					sleep( 0.2 );

				PN_Outro_Campbell_Check = GetNavigationPoint( 'PN_Outro_Campbell_Check' );
				PN_Outro_Paige_Check = GetNavigationPoint( 'PN_Outro_Paige_Check' );
				PN_Outro_McConnel_Check = GetNavigationPoint( 'PN_Outro_McConnel_Check' );

				PN_Outro_Campbell_Approach = GetNavigationPoint( 'PN_Outro_Campbell_Approach' );

			//===== Move Campbell , Paige , McConnel out

				ACTION_MoveToward( Campbell , PN_Outro_Campbell_Check , FALSE );
					sleep( 0.6 );
				ACTION_MoveToward( McConnel , PN_Outro_McConnel_Check , FALSE );
					sleep( 0.5 );
				ACTION_MoveToward( Paige , PN_Outro_Paige_Check , FALSE );

			//===== Wait for Campbell to finish his sequence of checking the area then move up
				ACTION_WaitForEvent( 'Event_SS_Outro_Campbell_Run' );

				ACTION_ChangeController( 'Midtro_Campbell' , class'Mind' );
				ACTION_ChangeController( 'Midtro_Campbell' , class'ScriptedController' );
				ACTION_ChangeScriptedSequenceDirect( Campbell , 'SS_Outro_Campbell_02' );
				ACTION_MoveToward( Campbell , PN_Outro_Campbell_Approach , FALSE );

				ACTION_WaitForEvent( 'Event_SS_Outro_Campbell_Speak' );

		//===== INITIATE

				i = 1.0;

				ResetAbsoluteTime();
				StartAbsoluteTime();

				WaitForAbsoluteTime( i );

		//========== START DIALOGUE
				ACTION_PlayLipSyncSound( 'Midtro_Campbell', "D00_0600.CAMPBELL_A", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "CAMPBELL_A" ) , 7.0 , 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 7.04 /-----CAMPBELL_A="Campbell: Red!  Cassidy sent the three of us down here to help secure the area. That shelling gave us quite a scare."
					WaitForAbsoluteTime( i += 0.5 );
				ACTION_SetLookAtTarget( 'Midtro_Campbell' , LT_Outro_07 , TRUE );
				Campbell.bDoHeadTurn = TRUE ;
					WaitForAbsoluteTime( i += 1.7 );
				ACTION_SetLookAtTarget( 'Midtro_Campbell' , GetLocalPlayerPawn() , TRUE );
					WaitForAbsoluteTime( i += 1.3 );
				ACTION_SetLookAtTarget( 'Midtro_McConnel' , LT_Outro_03 , TRUE );
				McConnel.bDoHeadTurn = TRUE ;
					WaitForAbsoluteTime( i += 1.5 );
				ACTION_SetLookAtTarget( 'Midtro_Paige' , LT_Outro_Center , TRUE );
				Paige.bDoHeadTurn = TRUE ;
					WaitForAbsoluteTime( i += 2.4 );
				ACTION_SetLookAtTarget( 'Midtro_McConnel' , LT_Outro_04 , TRUE );
					WaitForAbsoluteTime( i += 2.2 );

				ACTION_SetLookAtTarget( 'Midtro_Paige' , Campbell , TRUE );
				ACTION_PlayLipSyncSound( 'Midtro_Paige', "D00_0600.PAIGE_A", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "PAIGE_A" ) , 1.3 , 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 1.32 /-----PAIGE_LINE_A="Paige: Looks like he already secured it."
					WaitForAbsoluteTime( i += 0.2 );
				ACTION_SetLookAtTarget( 'Midtro_Campbell' , Paige , TRUE );
					WaitForAbsoluteTime( i += 0.5 );
				ACTION_SetLookAtTarget( 'Midtro_Paige' , GetLocalPlayerPawn() , TRUE );
					WaitForAbsoluteTime( i += 0.3 );
				ACTION_TriggerEvent( 'Event_SS_Outro_McConnel_Secure' );
					WaitForAbsoluteTime( i += 2.1 );

				ACTION_SetLookAtTarget( 'Midtro_Campbell' , GetLocalPlayerPawn() , TRUE );
				ACTION_PlayLipSyncSound( 'Midtro_Campbell', "D00_0600.CAMPBELL_B", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "CAMPBELL_B" ) , 8.8 , 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 8.87 /-----CAMPBELL_B="Campbell: Yeah I see that.   Well, the Colonel also sends word that Mac is on the road to Exit 4. We'll bring the supplies back Red, you go on ahead."
					WaitForAbsoluteTime( i += 1.7 );
				ACTION_SetLookAtTarget( 'Midtro_McConnel' , LT_Outro_02 , TRUE );
					WaitForAbsoluteTime( i += 2.4 );
				ACTION_SetLookAtTarget( 'Midtro_Paige' , LT_Outro_06 , TRUE );
					WaitForAbsoluteTime( i += 3.1 );
				ACTION_SetLookAtTarget( 'Midtro_McConnel' , LT_Outro_06 , TRUE );
					WaitForAbsoluteTime( i += 2.5 );
				ACTION_SetLookAtTarget( 'Midtro_Paige' , LT_Outro_04 , TRUE );
					WaitForAbsoluteTime( i += 1.9 );
				ACTION_SetLookAtTarget( 'Midtro_McConnel' , LT_Outro_Center , TRUE );
					WaitForAbsoluteTime( i += 0.7 );

					StopAbsoluteTime();

			//===== Fade to black and trigger outro scene
				ACTION_FadeOverlay( GetLocalPlayerController(), 1 , 1.0 );

					sleep( 1.0 );

				ACTION_TriggerEvent( 'TS_D00_0600_OutroScene' );

		ScriptEnd:
	}
