//=============================================================================
// TS_D00_1630_Outro_Scene.
//=============================================================================
class TS_D00_1630_Outro_Scene extends TriggeredScript
	placeable;

var float i;
var AnimPawn AP_Baker , AP_Corrion , AP_Desola , AP_Mac ;
var ActorLite PN_Outro_Baker , PN_Outro_Corrion , PN_Outro_Desola , PN_Outro_Mac ;
var WarGamePawn WGP_Baker , WGP_Corrion , WGP_Desola , WGP_Mac ;
var Actor LT_Outro_01 , LT_Outro_02 , LT_Outro_04 , LT_Outro_05 , LT_Outro_Center , LT_Outro_Distance_Check ;
	//----- Looktargets start with player at 12 o'clock and go clockwise

state triggered
	{
	function Ontrigger()
	{
	GotoState( 'OutroScene' );
	}
		Begin:

			//===== Spawn outro characters
				ACTION_TriggerEvent( 'CSU_OutroCharacters' );

			//===== Define Characters

				AP_Baker = Animpawn( GetPawn( 'Outro_Baker' ));
				AP_Corrion = AnimPawn( GetPawn( 'Outro_Corrion' ));
				AP_Desola = AnimPawn( GetPawn( 'Outro_Desola' ));
				AP_Mac = AnimPawn( GetPawn( 'Outro_Mac' ));

				WGP_Baker = WarGamePawn( GetPawn( 'Outro_Baker' ));
				WGP_Corrion = WarGamePawn( GetPawn( 'Outro_Corrion' ));
				WGP_Desola = WarGamePawn( GetPawn( 'Outro_Desola' ));
				WGP_Mac = WarGamePawn( GetPawn( 'Outro_Mac' ));

				PN_Outro_Baker = GetNavigationPoint( 'PN_Outro_Baker' );
				PN_Outro_Corrion = GetNavigationPoint( 'PN_Outro_Corrion' );
				PN_Outro_Desola = GetNavigationPoint( 'PN_Outro_Desola' );
				PN_Outro_Mac = GetNavigationPoint( 'PN_Outro_Mac' );

				LT_Outro_Distance_Check = GetFirstActor( 'LT_Outro_Distance_Check' );

				LT_Outro_01 = GetFirstActor( 'LT_Outro_01' );
				LT_Outro_02 = GetFirstActor( 'LT_Outro_02' );
				LT_Outro_04 = GetFirstActor( 'LT_Outro_04' );
				LT_Outro_05 = GetFirstActor( 'LT_Outro_05' );
				LT_Outro_Center = GetFirstActor( 'LT_Outro_Center' );

				ACTION_CrouchDirect( AP_Baker );
				ACTION_CrouchDirect( AP_Corrion );
				ACTION_CrouchDirect( AP_Desola );
				ACTION_CrouchDirect( AP_Mac );

			//===== Block outro nav points to stop other pawns from trying to claim them
				ACTION_BlockNavPoint( 'PN_Outro_Baker' );
				ACTION_BlockNavPoint( 'PN_Outro_Corrion' );
				ACTION_BlockNavPoint( 'PN_Outro_Desola' );
				ACTION_BlockNavPoint( 'PN_Outro_Mac' );

					sleep( 0.3 );

			//===== Change Baker , Corrion , Desola , Mac to scripted
				ACTION_RunDirect( AP_Baker );
				ACTION_RunDirect( AP_Corrion );
				ACTION_RunDirect( AP_Desola );
				ACTION_RunDirect( AP_Mac );

				ACTION_SetAnimSetDirect( AP_Mac , "a_hold_rifle.a_hold_rifle" );
				ACTION_SetAnimSetDirect( AP_Corrion , "a_hold_rifle.a_hold_rifle" );

				AP_Baker.Controller.bDemiGod = TRUE ;
				AP_Corrion.Controller.bDemiGod = TRUE ;
				AP_Desola.Controller.bDemiGod = TRUE ;
				AP_Mac.Controller.bDemiGod = TRUE ;

				ACTION_SetRepelBullets( 'Midtro_Baker' , TRUE );
				ACTION_SetRepelBullets( 'Midtro_Corrion' , TRUE );
				ACTION_SetRepelBullets( 'Midtro_Desola' , TRUE );
				ACTION_SetRepelBullets( 'Midtro_Mac' , TRUE );

					sleep( 0.6 );

				WGP_Baker.EWeaponAimedState = WAS_Relaxed ;
				WGP_Corrion.EWeaponAimedState = WAS_Relaxed ;
				WGP_Desola.EWeaponAimedState = WAS_Relaxed ;
				WGP_Mac.EWeaponAimedState = WAS_Relaxed ;

			//===== Move outro characters to outro positions and wait for Mac to reach his
				ACTION_MoveToward( AP_Baker , PN_Outro_Baker , TRUE );
					sleep( 0.8 );
				ACTION_MoveToward( AP_Desola , PN_Outro_Desola , TRUE );
					sleep( 0.5 );
				ACTION_MoveToward( AP_Corrion , PN_Outro_Corrion , TRUE );
					sleep( 0.4 );
				ACTION_MoveToward( AP_Mac , PN_Outro_Mac , FALSE );

			//===== Event triggered when Mac reaches his final destination
				While ( !PawnIsAtDestination ( AP_Mac , PN_Outro_Mac ))
					{
							ACTION_MoveToward( AP_Mac , PN_Outro_Mac , FALSE );
						sleep( 1.0 );
					}
				ACTION_TriggerEvent( 'Event_SS_Outro_Desola_Setup' );
				ACTION_TriggerEvent( 'Event_SS_Outro_Mac_Setup' );
				ACTION_TriggerEvent( 'Event_SS_Outro_Corrion_Setup' );

			//===== Turn on trigger for player to start outro dialogue
//					sleep( 0.3 );
//				ACTION_TriggerEvent( 'GBXTrig_Outro' );
				ACTION_TriggerEvent( 'TV_GBXTrig_Outro' );

}

state OutroScene
{
Begin:


	slog( "***************----------------------------TRIGGERED" );
//				ACTION_WaitForEvent( 'Event_Player_At_Outro' );

		//========== FREEZE PLAYER
				ACTION_LockPlayerMovement( GetLocalPlayerPawn() );
				ACTION_LimitPlayerInput( GetLocalPlayerController(), true );
				ACTION_HideHUD ( GetLocalPlayerController() , true );

			//===== Initialize
				i = 0.0;

				ResetAbsoluteTime();
				StartAbsoluteTime();

				WaitForAbsoluteTime( i );

		//===== BEGIN DIALOGUE

				AP_Baker.bDoHeadTurn = TRUE ;
				AP_Corrion.bDoHeadTurn = TRUE ;
				AP_Desola.bDoHeadTurn = TRUE ;
				AP_Mac.bDoHeadTurn = TRUE ;

			//===== TriggerEvent to start Baker's chat animation
				ACTION_TriggerEvent( 'Event_SS_Outro_Baker_Transition' );

				ACTION_SetLookAtTargetDirect( AP_Baker , LT_Outro_05 , TRUE );
				ACTION_PlayLipSyncSoundDirect( AP_Baker , "D00_1630.BAKER_J", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "BAKER_J1" ) , 2.3 , 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 2.25 /-----BAKER_J1="Baker: Looks like we only took out one 88."
					WaitForAbsoluteTime( i += 0.3 );
				ACTION_SetLookAtTargetDirect( AP_Corrion , LT_Outro_Center , TRUE );
					WaitForAbsoluteTime( i += 0.7 );
				ACTION_SetLookAtTargetDirect( AP_Desola , LT_Outro_04 , TRUE );
					WaitForAbsoluteTime( i += 0.8 );
				ACTION_SetLookAtTargetDirect( AP_Mac , LT_Outro_02 , TRUE );
					WaitForAbsoluteTime( i += 0.6 );

			//===== Trigger event to put Mac into relaxed pose
				ACTION_TriggerEvent( 'Event_SS_Outro_Mac_Transition' );

				ACTION_SetLookAtTargetDirect( AP_Baker , GetLocalPlayerPawn() , TRUE );
				ACTION_DisplaySubTitleMessage2( S_Localize( "BAKER_J2" ) , 2.9 , 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 2.86 /-----BAKER_J2="Baker: The second one turned tail before we could really get at it."
					WaitForAbsoluteTime( i += 0.4 );
				ACTION_SetLookAtTargetDirect( AP_Desola , GetLocalPlayerPawn() , TRUE );
					WaitForAbsoluteTime( i += 0.7 );
				ACTION_SetLookAtTargetDirect( AP_Corrion , AP_Baker , TRUE );
					WaitForAbsoluteTime( i += 0.5 );
				ACTION_SetLookAtTargetDirect( AP_Mac , LT_Outro_05 , TRUE );
					WaitForAbsoluteTime( i += 0.8 );
				ACTION_SetLookAtTargetDirect( AP_Baker , LT_Outro_Center , TRUE );
					WaitForAbsoluteTime( i += 1.7 );

				ACTION_SetLookAtTargetDirect( AP_Mac , AP_Corrion , TRUE );
				ACTION_PlayLipSyncSoundDirect( AP_Mac, "D00_1630.MAC_B", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "MAC_B" ) , 1.3 , 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 1.29 /-----MAC_B="Mac: What the hell happened to you?"
					WaitForAbsoluteTime( i += 0.6 );
				ACTION_SetLookAtTargetDirect( AP_Desola , AP_Corrion , TRUE );
					WaitForAbsoluteTime( i += 0.9 );
				ACTION_SetLookAtTargetDirect( AP_Baker , AP_Mac , TRUE );
					WaitForAbsoluteTime( i += 1.4 );

			//===== Trigger event for Corrion to get ready for his line
				ACTION_TriggerEvent( 'Event_SS_Outro_Corrion_Transition' );
				ACTION_SetLookAtTargetDirect( AP_Corrion , AP_Mac , TRUE );
				ACTION_PlayLipSyncSoundDirect( AP_Corrion , "D00_1630.CORRION_D", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "CORRION_D" ) , 1.2 , 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 1.16 /-----CORRION_D="Corrion: I tripped."
					WaitForAbsoluteTime( i += 0.4 );
				ACTION_SetLookAtTargetDirect( AP_Desola , AP_Mac , TRUE );
					WaitForAbsoluteTime( i += 0.8 );
				ACTION_SetLookAtTargetDirect( AP_Baker , GetLocalPlayerPawn() , TRUE );
					WaitForAbsoluteTime( i += 1.2 );

			//===== TriggerEvent to start Baker's combat ready animation
				ACTION_TriggerEvent( 'Event_SS_Outro_Baker_Transition_02' );
				ACTION_SetLookAtTargetDirect( AP_Corrion , GetLocalPlayerPawn() , TRUE );
				ACTION_PlayLipSyncSoundDirect( AP_Baker , "D00_1630.BAKER_K", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "BAKER_K" ) , 2.9 , 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 2.86 /-----BAKER_K="Baker: We need to get outta here."
					WaitForAbsoluteTime( i += 0.5 );
				ACTION_SetLookAtTargetDirect( AP_Baker , AP_Corrion , TRUE );
					WaitForAbsoluteTime( i += 0.9 );
				ACTION_SetLookAtTargetDirect( AP_Desola , LT_Outro_04 , TRUE );
					WaitForAbsoluteTime( i += 0.3 );

			//===== Trigger event for all squad members to return to combat stance
				ACTION_TriggerEvent( 'Event_SS_Outro_Transition' );

					WaitForAbsoluteTime( i += 1.5 );

					StopAbsoluteTime();

			//===== End map
				ACTION_SetObjectiveStatus( 0, OI_Complete, 'ObjectiveList' );
				ACTION_TriggerEvent( 'TriggeredScriptMapComplete' );

		ScriptEnd:
	}
