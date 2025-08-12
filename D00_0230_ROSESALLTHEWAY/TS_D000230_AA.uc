//=============================================================================
// TS_D000230_AA.
//=============================================================================
class TS_D000230_AA extends TriggeredScript
	placeable;

var AnimPawn AP_Hartsock, AP_Paddock, AP_Doyle, AP_Cole, AP_Cassidy, AP_US1, AP_US2;
var AnimPawn AP_Flak_01 , AP_Flak_02 , AP_Flak_03 ;
var AnimPawn PAWN_Intro_g1, PAWN_Intro_g2, PAWN_Intro_g3, PAWN_Intro_g4;
var WarGamePawn WGP_Paddock ;
var ActorLite PN_Paddock_Fire , PN_Paddock_Approach , PN_Doyle_Watch , PN_Doyle_Watch_02 , PN_Paddock_Grenade ;
var Actor LT_AA_Moment_01 , LT_AA_Moment_02 , LT_AA_Moment_03 , LT_AA_Moment_04 , LT_AA_Moment_Center ;
var float i;

State Triggered
	{
		Begin:

			ACTION_DisableBattleDialogueForCharacter( 'AP_Doyle' );
			GetLocalPlayerController().bHideSuppressionIcons = TRUE ;

				sleep(0.2);

			if( vSize( AP_Doyle.location - GetFirstActor( 'LT_Doyle_Shout_Check' ).location ) < 6144.0 )
				{
					ACTION_PlayLipSyncSoundDirect( AP_Doyle , "D00_0230.DOYLE_C", 1.0, 1.0, 1.0, ,'bottom_lip' );
					ACTION_DisplaySubTitleMessage2( S_Localize("DOYLE_C"), 4.0, 1, 1, 1, TRUE, TRUE );
						//-----/----- DOYLE_C="Doyle: Anti Aircraft...   We're gonna have to be smart about this..."
				}

			ACTION_TriggerEvent( 'CSU_AA' );
			ACTION_DisableBattleDialogueForCharacter( 'AP_Paddock' );	

			AP_Flak_01 = AnimPawn( GetPawn( 'ap_flak1' ));
			AP_Flak_02 = AnimPawn( GetPawn( 'ap_flak2' ));
			AP_Flak_03 = AnimPawn( GetPawn( 'ap_flak3' ));

			LT_AA_Moment_01 = GetFirstActor( 'LT_AA_Moment_01' );
			LT_AA_Moment_02 = GetFirstActor( 'LT_AA_Moment_02' );
			LT_AA_Moment_03 = GetFirstActor( 'LT_AA_Moment_03' );
			LT_AA_Moment_04 = GetFirstActor( 'LT_AA_Moment_04' );
			LT_AA_Moment_Center = GetFirstActor( 'LT_AA_Moment_Center' );

			WGP_Paddock = WarGamePawn( GetPawn( 'AP_Paddock' ));

			AP_Paddock = AnimPawn( GetPawn('AP_Paddock') );
			AP_Doyle =  AnimPawn( Getpawn( 'AP_Doyle' ));

			AP_Paddock.Controller.bGodMode = TRUE ;
			ACTION_SetRepelBullets( 'AP_Paddock' , TRUE );

			PN_Paddock_Grenade = GetNavigationPoint( 'PN_Paddock_Grenade' );
			PN_Paddock_Fire = GetNavigationPoint( 'PN_Paddock_Fire' );
			PN_Paddock_Approach = GetNavigationPoint( 'PN_Paddock_Approach' );
			PN_Doyle_Watch = GetNavigationPoint( 'PN_Doyle_Watch' );
			PN_Doyle_Watch_02 = GetNavigationPoint( 'PN_Doyle_Watch_02' );

		//===== Move Paddock to THROW GRENADE
			ACTION_TriggerEvent( 'TS_D000230_AA_Paddock_Throw' );
	
		//===== Wait for sequence to start to sync timing
			ACTION_WaitForEvent( 'Event_SS_Paddock_AA_01_Start' );

				i=0.0;
				ResetAbsoluteTime();
				StartAbsoluteTime();

				WaitForAbsoluteTime( i+= 5.0 );

			AP_Flak_01.Controller.bGodMode = FALSE ;
			AP_Flak_02.Controller.bGodMode = FALSE ;
			AP_Flak_03.Controller.bGodMode = FALSE ;

				//===== Grenade goes off and destroys flak gun
			ACTION_ForceTurretDismount( 'FLAKKA' );
			ACTION_KillPawn( 'ap_flak1' , vect( 0.019 , 0.021 , 0.098 ), 'bip01 L Calf' );
			ACTION_KillPawn( 'ap_flak2' , vect( -0.031 , 0.016 , 0.061 ), 'bip01 L Foot' );
			ACTION_KillPawn( 'ap_flak3' , vect( 0.012 , 0.028 , 0.039 ), 'bip01 Spine' );
			ACTION_SetTurretDestroyed( 'FLAKKA' );
			ACTION_TriggerEvent( 'gbxET_Paddock_Grenade' );
			ACTION_TriggerEvent( 'pfx_Grenade_Blast' );

			GetLocalPlayerController().bHideSuppressionIcons = FALSE ;

		//===== Trigger Doyle sequence to make him run up
			ACTION_TriggerEvent( 'TS_D000230_AA_Doyle' );

				WaitForAbsoluteTime( i+= 0.4 );
			ACTION_PlayLipSyncSoundDirect( AP_Flak_01 , "BD_SP_GER_A.M_PAIN_B", 1.0, 1.0, 1.0 );
				WaitForAbsoluteTime( i+= 1.6 );
			ACTION_PlayLipSyncSoundDirect( AP_Flak_03 , "BD_SP_GER_C.M_superpain_b", 1.0, 1.0, 1.0 );

		//===== Paddock fires at Germans for ~2 seconds
				WaitForAbsoluteTime( i+= 2.0 );

			AP_Paddock.Controller.bGodMode = FALSE ;
			ACTION_SetRepelBullets( 'AP_Paddock' , FALSE );

			ACTION_WaitForEvent( 'Event_AA_Paddock_Approach' );

	//========== DIALOGUE

				i=0.0;
				ResetAbsoluteTime();
				StartAbsoluteTime();

			ACTION_SetLookAtTargetDirect( AP_Paddock , LT_AA_Moment_03 , TRUE );
			AP_Paddock.bDoHeadTurn = TRUE ;
			ACTION_PlayLipSyncSoundDirect( AP_Paddock, "D00_0230.PADDOCK_A", 1.0, 1.0, 1.0, ,'bottom_lip' );
			ACTION_DisplaySubTitleMessage2( S_Localize("PADDOCK_A"), 3.5, 1, 1, 1, TRUE, TRUE );
				//-----/ 3.74 /----- PADDOCK_A="Paddock: You should see the look on ya'lls faces."

				WaitForAbsoluteTime( i+= 1.9 );
			ACTION_SetLookAtTargetDirect( AP_Paddock , GetLocalPlayerPawn() , TRUE );
				WaitForAbsoluteTime( i+= 2.1 );

			if( AP_Doyle.Health > 0 && vSize( AP_Doyle.location - AP_Paddock.location ) < 1024 )
				{
					ACTION_SetLookAtTargetDirect( AP_Doyle , LT_AA_Moment_01 , TRUE );
					AP_Doyle.bDoHeadTurn = TRUE ;
					ACTION_PlayAnimWithQueueDirect( AP_Doyle , 'standing_chatting_3', 0.2 , 1.0 );
					ACTION_PlayLipSyncSoundDirect( AP_Doyle , "D00_0230.DOYLE_D", 1.0, 1.0, 1.0, ,'bottom_lip' );
					ACTION_DisplaySubTitleMessage2( S_Localize("DOYLE_D"), 2.7, 1, 1, 1, TRUE, TRUE );	
						//-----/ 1.44 /----- DOYLE_D="Doyle: Did you forget the password?"

						WaitForAbsoluteTime( i+= 0.2 );
					ACTION_SetLookAtTargetDirect( AP_Paddock , AP_Doyle , TRUE );
						WaitForAbsoluteTime( i+= 0.5 );
					ACTION_SetLookAtTargetDirect( AP_Doyle , AP_Paddock , TRUE );
						WaitForAbsoluteTime( i+= 0.7 );
					ACTION_SetLookAtTargetDirect( AP_Paddock , LT_AA_Moment_Center , TRUE );
						WaitForAbsoluteTime( i+= 0.4 );

					ACTION_SetLookAtTargetDirect( AP_Paddock , AP_Doyle , TRUE );
					ACTION_PlayLipSyncSoundDirect( AP_PADDOCK , "D00_0230.PADDOCK_B", 1.0, 1.0, 1.0, ,'bottom_lip' );
					ACTION_DisplaySubTitleMessage2( S_Localize("PADDOCK_B"), 7.0, 1, 1, 1, TRUE, TRUE );
						//-----/ 6.68 /----- PADDOCK_B="Paddock: Naw, I remembered... Flash answered by thunder and all that.  
						//				I could see plain as day it was Red from 3rd squad."

						WaitForAbsoluteTime( i+= 0.8 );
					ACTION_SetLookAtTargetDirect( AP_Doyle , GetLocalPlayerPawn() , TRUE );
						WaitForAbsoluteTime( i+= 1.5 );
					ACTION_SetLookAtTargetDirect( AP_Paddock , LT_AA_Moment_04 , TRUE );
						WaitForAbsoluteTime( i+= 1.9 );
					ACTION_SetLookAtTargetDirect( AP_Doyle , AP_Paddock , TRUE );
						WaitForAbsoluteTime( i+= 1.3 );
					ACTION_SetLookAtTargetDirect( AP_Paddock , GetLocalPlayerPawn() , TRUE );
						WaitForAbsoluteTime( i+= 0.9 );

					ACTION_SetLookAtTargetDirect( AP_Doyle , LT_AA_Moment_01 , TRUE );
					ACTION_PlayAnimWithQueueDirect( AP_Doyle , 'standing_chatting_5', 0.2 , 1.2 );
					ACTION_PlayLipSyncSoundDirect( AP_Doyle , "D00_0230.DOYLE_E", 1.0, 1.0, 1.0, ,'bottom_lip' );
					ACTION_DisplaySubTitleMessage2( S_Localize("DOYLE_E"), 2.4, 1, 1, 1, TRUE, TRUE );
						//-----/ 1.10----- DOYLE_E="Doyle: We could have shot you."

						WaitForAbsolutetime( i+= 0.7 );
					ACTION_SetLookAtTargetDirect( AP_Paddock , LT_AA_Moment_Center , TRUE );
						WaitForAbsolutetime( i+= 0.8 );

					ACTION_SetLookAtTargetDirect( AP_Paddock , AP_Doyle , TRUE );
					ACTION_PlayLipSyncSoundDirect( AP_PADDOCK , "D00_0230.PADDOCK_C", 1.0, 1.0, 1.0, ,'bottom_lip' );
					ACTION_DisplaySubTitleMessage2( S_Localize("PADDOCK_C"), 5.0, 1, 1, 1, TRUE, TRUE );
						//-----/ 4.48 /----- PADDOCK_C="Paddock: Well damn good thing you didn't right?  Shit, I'd have been mighty ticked off."

						WaitForAbsolutetime( i+= 1.2 );
					ACTION_SetLookAtTargetDirect( AP_Doyle , AP_Paddock , TRUE );
						WaitForAbsolutetime( i+= 1.1 );
					ACTION_SetLookAtTargetDirect( AP_Paddock , GetLocalPlayerPawn() , TRUE );
						WaitForAbsolutetime( i+= 1.9 );
					ACTION_SetLookAtTargetDirect( AP_Doyle , GetLocalPlayerPawn() , TRUE );
						WaitForAbsolutetime( i+= 0.5 );

					ACTION_SetLookAtTargetDirect( AP_Paddock , AP_Doyle , TRUE );
					ACTION_PlayAnimWithQueueDirect( AP_Doyle , 'standing_chatting_2', 0.2 , 1.0 );
					ACTION_PlayLipSyncSoundDirect( AP_Doyle , "D00_0230.DOYLE_F", 1.0, 1.0, 1.0, ,'bottom_lip' );
					ACTION_DisplaySubTitleMessage2( S_Localize("DOYLE_F"), 3.4, 1, 1, 1, TRUE, TRUE );
						//-----/ 1.09 /----- DOYLE_F="Doyle: We should keep moving."

						WaitForAbsoluteTime( i+= 0.4 );
					ACTION_ClearLookAtTargetDirect( AP_Paddock );
						WaitForAbsoluteTime( i+= 0.3 );
					ACTION_ClearLookAtTargetDirect( AP_Doyle );
						WaitForAbsoluteTime( i+= 0.5 );

				}

			AP_Paddock.Controller.Focus = None ;
			AP_Doyle.Controller.Focus = None ;

			ACTION_ClearLookAtTargetDirect( AP_Paddock );
			ACTION_ClearLookAtTargetDirect( AP_Doyle );

		//==== Destroy trigger that locks the player
			ACTION_DestroyActor( 'GBXTrig_AA_Freeze_Player' );

			//===== UN-Lock the player
				ACTION_LimitPlayerInput( GetLocalPlayerController(), FALSE ); 
				ACTION_UnLockPlayerMovement( GetLocalPlayerPawn() );
				ACTION_UnBlockNavPoints( 'PN_AA_Block' );
				ACTION_UnBlockNavPoint( 'PN_Paddock_Approach' );

				sleep( 0.2 );

			ACTION_UnBlockActionKeys( -1 );
			ACTION_BlockActionKeys( KEY_ACTION_SA_VIEW );


		//===== Change Doyle & Paddock to mind and join up units with the player
			getFirstActor( 'TS_D000230_AA_Doyle' ).goToState( 'Doyle_Exit' );

				sleep( 0.5 );
			AP_Doyle.Controller.Focus = NONE ;
			ACTION_ChangeControllerDirect( AP_Doyle , class'Mind' );
			AP_Doyle.Controller.bGodMode = FALSE ;
			ACTION_SetRepelBullets( 'AP_Doyle' , FALSE );
			ACTION_OrderFallout( 'Unit_US_Assault' );

			ACTION_TriggerEvent( 'BVT_AA_Slope' );

			//===== If training is on , block paths
				if ( !ACTION_IsTrainingDisabled() )
					{
						GetLocalPlayerController().bGodMode = TRUE ;
						ACTION_SetRepelBulletsDirect( GetLocalPlayerPawn() , TRUE );
						ACTION_SetRepelBullets( 'AP_Doyle' , TRUE );
						ACTION_SetRepelBullets( 'AP_Paddock' , TRUE );
						ACTION_BlockNavPoints( 'PN_C1_Flank_Block' );
					}

		//===== CHECKPOINT 02 SAVE
			ACTION_TriggerEvent( 'TS_Checkpoint2Save' );
				sleep( 3.5 );

			if( AP_Doyle.Health > 0 && vSize( AP_Doyle.location - AP_Paddock.location ) < 1024 )
				{
					ACTION_PlayLipSyncSoundDirect( AP_PADDOCK , "D00_0230.PADDOCK_D", 1.0, 1.0, 1.0, ,'bottom_lip' );
					ACTION_DisplaySubTitleMessage2( S_Localize("PADDOCK_D"), 2.9, 1, 1, 1, TRUE, TRUE );
						//-----/ 2.90 /----- PADDOCK_D="Paddock: Well I ain't yelling Flash. So what are we doing guys?"

						sleep( 3.1 );
				}

				sleep( 2.9 );

			AP_Doyle.Health = 200.0 ;
			AP_Paddock.Health = 200.0 ;

				sleep( 2.0 );

			ACTION_EnableBattleDialogueForCharacter( 'AP_Doyle' );
			ACTION_EnableBattleDialogueForCharacter( 'AP_Paddock' );
	}

