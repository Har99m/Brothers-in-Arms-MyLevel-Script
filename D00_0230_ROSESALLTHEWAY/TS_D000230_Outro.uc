//=============================================================================
// TS_D000230_Outro.
//=============================================================================
class TS_D000230_Outro extends TriggeredScript
	placeable;

var Actor LT_Outro_Cassidy_Front ;
var AnimPawn AP_Cassidy , AP_Hooper , AP_Locke ;
var WarGamePawn WGP_Cassidy , WGP_Hooper , WGP_Locke ;
var ActorLite PN_Outro_Cassidy , PN_Outro_Locke , PN_Outro_Hooper ;
var Pawn Player ;
var float i , PlayerDistance ;

State Triggered
	{
		Begin:

			//===== Spawn Cassidy and his fools
				ACTION_TriggerEvent( 'CSU_Outro' );

			//===== Move up Cole's unit
				ACTION_OrderMove( 'UNIT_US_Cole' , 'PN_Cole_Flank_03' );
				ACTION_OrderMove( 'UNIT_US_Cole' , 'PN_Outro_Cole_Setup' , TRUE );

			//===== Define
				Player = GetLocalPlayerPawn();

				AP_Hooper = AnimPawn( GetPawn( 'AP_Hooper' ));
				AP_Locke = AnimPawn( GetPawn( 'AP_Locke' ));
				AP_Cassidy =  AnimPawn( Getpawn( 'AP_Cassidy' ));

				LT_Outro_Cassidy_Front = getFirstActor( 'LT_Outro_Cassidy_Front' );

				PN_Outro_Locke = GetNavigationPoint( 'PN_Outro_Locke' );
				PN_Outro_Hooper = GetNavigationPoint( 'PN_Outro_Hooper' );
				PN_Outro_Cassidy = GetNavigationPoint( 'PN_Outro_Cassidy' );

				WGP_Cassidy = WarGamePawn( GetPawn( 'AP_Cassidy' ));
				WGP_Locke = WarGamePawn( GetPawn( 'AP_Locke' ));
				WGP_Hooper = WarGamePawn( GetPawn( 'AP_Hooper' ));

					sleep( 0.2 );

			//===== Cassidy scripted
				ACTION_ChangeControllerDirect( AP_Cassidy , class'ScriptedController' );
				ACTION_ChangeScriptedSequenceDirect( AP_Cassidy , 'SS_Outro_Cassidy' );
				ACTION_ChangeControllerDirect( AP_Locke , class'ScriptedController' );
				ACTION_ChangeScriptedSequenceDirect( AP_Locke , 'SS_Outro_Locke' );
				ACTION_ChangeControllerDirect( AP_Hooper , class'ScriptedController' );
				ACTION_ChangeScriptedSequenceDirect( AP_Hooper , 'SS_Outro_Hooper' );

				WGP_Cassidy.EWeaponAimedState = WAS_Relaxed ;
				WGP_Locke.EWeaponAimedState = WAS_Relaxed ;
				WGP_Hooper.EWeaponAimedState = WAS_Relaxed ;

				AP_Cassidy.Controller.bGodMode = TRUE ;
				ACTION_SetRepelBullets( 'AP_Cassidy' , TRUE );
				ACTION_RunDirect( AP_Cassidy );
				ACTION_RunDirect( AP_Locke );
				ACTION_RunDirect( AP_Hooper );

				ACTION_UnblockNavPoints( 'PN_Cassidy_Block' );

			//===== Move Cassidy to outro position and wait
				ACTION_MoveToward( AP_Locke , PN_Outro_Locke , TRUE );
					sleep( 0.6 );
				ACTION_MoveToward( AP_Hooper , PN_Outro_Hooper , TRUE );
					sleep( 0.9 );
				ACTION_MoveToward( AP_Cassidy, PN_Outro_Cassidy , TRUE );

				While( !PawnIsAtDestination( AP_Cassidy , PN_Outro_Cassidy ))
					{
							sleep( 1.0 );
						ACTION_MoveToward( AP_Cassidy, PN_Outro_Cassidy , FALSE );
					}

				ACTION_DisableBattleDialogueForCharacter( 'AP_Doyle' );
				ACTION_DisableBattleDialogueForCharacter( 'AP_Paddock' );

					sleep( 0.8 );

				ACTION_EnableBattleDialogueForCharacter( 'AP_Doyle' );
				ACTION_EnableBattleDialogueForCharacter( 'AP_Paddock' );

			//===== Wait for player to reach Cassidy and lock them for the outro
					while( VSize( Player.Location - LT_Outro_Cassidy_Front.Location ) > 128 )
						{
								sleep( 0.4 );
						}

				ACTION_LockPlayerMovement( GetLocalPlayerPawn() );
				ACTION_LimitPlayerInput( GetLocalPlayerController(), TRUE );
				ACTION_BlockActionKeys( KEY_ACTION_CROUCH  );
			if( GetLocalPlayerPawn().bIsCrouched )
				GetLocalPlayerPawn().ForceCrouch(); 
	
		//===== DIALOGUE - CASSIDY
					i=0.0;
					ResetAbsoluteTime();
					StartAbsoluteTime();

				ACTION_TriggerEvent( 'Event_SS_Outro_Cassidy_Talk' );
				AP_Cassidy.bDoHeadTurn = TRUE ;
				ACTION_SetLookAtTargetDirect( AP_Cassidy , GetLocalPlayerPawn() , TRUE );
				ACTION_PlayLipSyncSoundDirect( AP_CASSIDY , "D00_0230.CASSIDY_A", 1.0, 1.0, 1.0, ,'bottom_lip' );
				ACTION_DisplaySubTitleMessage2( S_Localize("CASSIDY_A1"), 6.5, 1, 1, 1, TRUE, TRUE );
					//-----/ 6.50 /----- CASSIDY_A1="Cassidy: About time I found some more men. There's an abandoned gun battery not far from here... just outside of St. Martin."		( ~ 6.8 )	

					WaitForAbsoluteTime( i+=6.8 );

				ACTION_DisplaySubTitleMessage2( S_Localize("CASSIDY_A2"), 6.6 , 1, 1, 1, TRUE, TRUE );
					//-----/ 6.66 /----- CASSIDY_A2="Cassidy: I'm setting up CP in a farmhouse there, so you men stick with me.  We've got a lot of work to do."				( ~ 7.0 )

					WaitForAbsoluteTime( i+=7.2 );

			//===== End map
				ACTION_TriggerEvent( 'TriggeredScriptMapComplete' );
	}
