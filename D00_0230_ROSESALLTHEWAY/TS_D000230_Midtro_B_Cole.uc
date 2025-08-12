//=============================================================================
// TS_D000230_Midtro_B_Cole.
//=============================================================================
class TS_D000230_Midtro_B_Cole extends TriggeredScript
	placeable;

var AnimPawn AP_Hartsock, AP_Paddock, AP_Doyle, AP_Cole, AP_Campbell , AP_Boyd ;
var AnimPawn PAWN_Intro_g1, PAWN_Intro_g2, PAWN_Intro_g3, PAWN_Intro_g4;
var ActorLite PN_Cole_01 , PN_Cole_02 , PN_Doyle_Greet , PN_Paddock_Greet , PN_Unit_US1 , PN_Unit_US2 ;
var Actor SM_HorseCart_01 , SM_HorseCart_02 ;
var Actor LT_Midtro_01 , LT_Midtro_02 , LT_Midtro_03 , LT_Midtro_04 , LT_Midtro_05 , LT_Midtro_06 , LT_Midtro_Center ;
var AnimPawn AP_Outro_Convoy_01_Horse , AP_Outro_Convoy_02_Horse , AP_Outro_Convoy_03_Horse , AP_Outro_Convoy_04_Horse , AP_Outro_Convoy_06_Horse , AP_Outro_Convoy_07_Horse ;
var AnimPawn AP_Outro_Convoy_01_Wagon , AP_Outro_Convoy_02_Wagon , AP_Outro_Convoy_03_Wagon , AP_Outro_Convoy_04_Wagon , AP_Outro_Convoy_06_Wagon , AP_Outro_Convoy_07_Wagon ;
var Actor SM_Convoy_Cargo_01 , SM_Convoy_Cargo_02 , SM_Convoy_Cargo_03 , SM_Convoy_Cargo_04 ;
var float i;

State Triggered 
	{
		Begin:
				ACTION_DisableBattleDialogueForCharacter( 'AP_Doyle' );
				ACTION_DisableBattleDialogueForCharacter( 'AP_Paddock' );

		//========= BEGIN SCENE
					i=0.0;
					ResetAbsoluteTime();
					StartAbsoluteTime();

			//===== Spawn cole, us1, us2,
				ACTION_TriggerEvent( 'CSU_Cole' );
					WaitForAbsoluteTime( i+= 0.2 );
				ACTION_TriggerEvent( 'CSU_Cole_Boyd' );
					WaitForAbsoluteTime( i+= 0.1 );
				ACTION_TriggerEvent( 'CSU_Cole_Campbell' );
					WaitForAbsoluteTime( i+= 0.2 );

				AP_Cole = AnimPawn( GetPawn( 'AP_Cole' ));
				AP_Doyle = AnimPawn( GetPawn( 'AP_Doyle' ));
				AP_Paddock = AnimPawn( GetPawn( 'AP_Paddock' ));
				AP_Campbell = AnimPawn( GetPawn( 'AP_Campbell' ));
				AP_Boyd = AnimPawn( GetPawn( 'AP_Boyd' ));

				PN_Cole_01 = GetNavigationPoint( 'PN_Cole_01' );
				PN_Cole_02 = GetNavigationPoint( 'PN_Cole_02' );
				PN_Doyle_Greet = GetNavigationPoint( 'PN_Doyle_Greet' );
				PN_Paddock_Greet = GetNavigationPoint( 'PN_Paddock_Greet' );
				PN_Unit_US1 = GetNavigationPoint( 'PN_Unit_US1' );
				PN_Unit_US2 = GetNavigationPoint( 'PN_Unit_US2' );

				AP_Outro_Convoy_01_Horse = AnimPawn( GetPawn( 'AP_Outro_Convoy_01_Horse' ));
				AP_Outro_Convoy_02_Horse = AnimPawn( GetPawn( 'AP_Outro_Convoy_02_Horse' ));
				AP_Outro_Convoy_03_Horse = AnimPawn( GetPawn( 'AP_Outro_Convoy_03_Horse' ));
				AP_Outro_Convoy_04_Horse = AnimPawn( GetPawn( 'AP_Outro_Convoy_04_Horse' ));
				AP_Outro_Convoy_06_Horse = AnimPawn( GetPawn( 'AP_Outro_Convoy_06_Horse' ));
				AP_Outro_Convoy_07_Horse = AnimPawn( GetPawn( 'AP_Outro_Convoy_07_Horse' ));

				AP_Outro_Convoy_01_Wagon = AnimPawn( GetPawn( 'AP_Outro_Convoy_01_Wagon' ));
				AP_Outro_Convoy_02_Wagon = AnimPawn( GetPawn( 'AP_Outro_Convoy_02_Wagon' ));
				AP_Outro_Convoy_03_Wagon = AnimPawn( GetPawn( 'AP_Outro_Convoy_03_Wagon' ));
				AP_Outro_Convoy_04_Wagon = AnimPawn( GetPawn( 'AP_Outro_Convoy_04_Wagon' ));
				AP_Outro_Convoy_06_Wagon = AnimPawn( GetPawn( 'AP_Outro_Convoy_06_Wagon' ));
				AP_Outro_Convoy_07_Wagon = AnimPawn( GetPawn( 'AP_Outro_Convoy_07_Wagon' ));

				LT_Midtro_01 = GetFirstActor( 'LT_Midtro_01' );
				LT_Midtro_02 = GetFirstActor( 'LT_Midtro_02' );
				LT_Midtro_03 = GetFirstActor( 'LT_Midtro_03' );
				LT_Midtro_04 = GetFirstActor( 'LT_Midtro_04' );
				LT_Midtro_05 = GetFirstActor( 'LT_Midtro_05' );
				LT_Midtro_06 = GetFirstActor( 'LT_Midtro_06' );
				LT_Midtro_Center = GetFirstActor( 'LT_Midtro_Center' );

				SM_Convoy_Cargo_01 = GetFirstActor( 'SM_Convoy_Cargo_01' );
				SM_Convoy_Cargo_02 = GetFirstActor( 'SM_Convoy_Cargo_02' );
				SM_Convoy_Cargo_03 = GetFirstActor( 'SM_Convoy_Cargo_03' );
				SM_Convoy_Cargo_04 = GetFirstActor( 'SM_Convoy_Cargo_04' );

				SM_HorseCart_01 = GetFirstActor( 'SM_HorseCart_01' );
				SM_HorseCart_02 = GetFirstActor( 'SM_HorseCart_02' );

					WaitForAbsoluteTime( i+= 1.5 );

			//===== Set up animations
				ACTION_TriggerEvent( 'Event_SS_Boyd_Setup' );
				ACTION_TriggerEvent( 'Event_SS_Campbell_Setup' );
				ACTION_TriggerEvent( 'Event_SS_Cole_Setup' );

				AP_Cole.Controller.bGodMode = TRUE ;
				ACTION_SetRepelBullets( 'AP_Cole' , TRUE );

			//==== Turn on horse shooter triggers
				ACTION_TriggerEvent( 'gbxTrig_Shoot_Horse' );

			//==== Unhide horsecarts
				AP_Outro_Convoy_01_Horse.bHidden = FALSE ;
				AP_Outro_Convoy_02_Horse.bHidden = FALSE ;
				AP_Outro_Convoy_03_Horse.bHidden = FALSE ;
				AP_Outro_Convoy_04_Horse.bHidden = FALSE ;
				AP_Outro_Convoy_06_Horse.bHidden = FALSE ;
				AP_Outro_Convoy_07_Horse.bHidden = FALSE ;

				AP_Outro_Convoy_01_Horse.Health = 150 ;
				AP_Outro_Convoy_02_Horse.Health = 150 ;
				AP_Outro_Convoy_03_Horse.Health = 150 ;
				AP_Outro_Convoy_04_Horse.Health = 150 ;
				AP_Outro_Convoy_06_Horse.Health = 150 ;
				AP_Outro_Convoy_07_Horse.Health = 150 ;

				AP_Outro_Convoy_01_Wagon.bHidden = FALSE ;
				AP_Outro_Convoy_02_Wagon.bHidden = FALSE ;
				AP_Outro_Convoy_03_Wagon.bHidden = FALSE ;
				AP_Outro_Convoy_04_Wagon.bHidden = FALSE ;
				AP_Outro_Convoy_06_Wagon.bHidden = FALSE ;
				HorseCarriage( GetPawn( 'AP_Outro_Convoy_06_Wagon' )).PlayDeathAnim();
				AP_Outro_Convoy_07_Wagon.bHidden = FALSE ;

				SM_Convoy_Cargo_01.bHidden = FALSE ;
				SM_Convoy_Cargo_02.bHidden = FALSE ;
				SM_Convoy_Cargo_03.bHidden = FALSE ;
				SM_Convoy_Cargo_04.bHidden = FALSE ;

				SM_HorseCart_01.bHidden = FALSE ;
				SM_HorseCart_02.bHidden = FALSE ;

				ACTION_TriggerEvent( 'Event_SS_Midtro_Horse_Setup' );

				AP_Outro_Convoy_02_Wagon.AttachToBone( SM_Convoy_Cargo_01 , 'cargo' );
				AP_Outro_Convoy_04_Wagon.AttachToBone( SM_Convoy_Cargo_04 , 'cargo' );
				AP_Outro_Convoy_06_Wagon.AttachToBone( SM_Convoy_Cargo_03 , 'cargo' );

		//========== WAIT FOR PLAYER TO REACH COLE
				ACTION_WaitForEvent( 'Event_Player_Approach_Cole' );

				ACTION_TriggerEvent( 'TS_D000230_Training_WeaponSwitch' );

				ACTION_UnBlockNavPoints( 'PN_Cole_Squad_Blocker' );

					i=0.0;
					ResetAbsoluteTime();
					StartAbsoluteTime();

				ACTION_KillPawn( 'c101_a' );
					WaitForAbsoluteTime( i+= 0.2 );

				ACTION_TriggerEvent( 'Event_SS_Boyd_End' );
				ACTION_KillPawn( 'c101_b' );
					WaitForAbsoluteTime( i+= 0.1 );
				ACTION_KillPawn( 'c102_a' );
				ACTION_TriggerEvent( 'Event_SS_Campbell_End' );
					WaitForAbsoluteTime( i+= 0.2 );
				ACTION_KillPawn( 'c102_b' );
				ACTION_TriggerEvent( 'Event_SS_Cole_End' );

		//========== Check if Doyle or Paddock are too far from scene , if so , teleport them in
				if( AP_Doyle.Health > 0 && vSize( AP_Doyle.location - GetFirstActor( 'LT_Midtro_06' ).location ) > 4096 )
					{
						ACTION_TeleportPawnToActor( AP_Doyle , 'LT_Doyle_Teleport_Midtro' );
					}
				if( AP_Paddock.Health > 0 && vSize( AP_Paddock.location - GetFirstActor( 'LT_Midtro_06' ).location ) > 4096 )
					{
						ACTION_TeleportPawnToActor( AP_Paddock , 'LT_Paddock_Teleport_Midtro' );
					}

					WaitForAbsoluteTime( i+= 0.3 );

			//===== Doyle and Paddock scripted
				ACTION_ChangeControllerDirect( AP_Doyle , class'ScriptedController' );
				ACTION_RunDirect( AP_Doyle );
				ACTION_ChangeControllerDirect( AP_Paddock , class'ScriptedController' );
				ACTION_RunDirect( AP_Paddock );
				ACTION_DisableBattleDialogueForCharacter( 'AP_Doyle' );
				ACTION_DisableBattleDialogueForCharacter( 'AP_Paddock' );
					WaitForAbsoluteTime( i+= 0.1 );

				ACTION_ChangeScriptedSequenceDirect( AP_Doyle , 'SS_Midtro_Doyle' );
				ACTION_ChangeScriptedSequenceDirect( AP_Paddock , 'SS_Midtro_Paddock' );

					WaitForAbsoluteTime( i+= 0.5 );

			//==== Move up Doyle and his unit

				ACTION_OrderFallOut( 'Unit_US_Assault' );
				ACTION_MoveToward( AP_Doyle , PN_Doyle_Greet , TRUE , LT_Midtro_02 );
				ACTION_MoveToward( AP_Paddock , PN_Paddock_Greet , TRUE , LT_Midtro_01 );

				ACTION_PlayLipSyncSoundDirect( AP_COLE , "D00_0230.COLE_A", 1.0, 1.0, 1.0, ,'bottom_lip' );
				ACTION_DisplaySubTitleMessage2( S_Localize("COLE_A"), 1.0 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 0.82 /----- COLE_A="Cole: Flash."

					WaitForAbsoluteTime( i+= 3.0 );

			if( AP_Paddock.Health > 0 )
				{
					ACTION_PlayLipSyncSoundDirect( AP_PADDOCK , "D00_0230.PADDOCK_E", 1.0, 1.0, 1.0, ,'bottom_lip' );
					ACTION_DisplaySubTitleMessage2( S_Localize("PADDOCK_E1"), 1.0 , 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 1.00 /----- PADDOCK_E1="Paddock: Thunder."

						WaitForAbsoluteTime( i+= 0.2 );
					ACTION_SetLookAtTargetDirect( AP_Campbell , AP_Boyd , TRUE );
					AP_Campbell.bDoHeadTurn = TRUE ;
						WaitForAbsoluteTime( i+= 0.3 );
					ACTION_SetLookAtTargetDirect( AP_Boyd , AP_Campbell , TRUE );
					AP_Boyd.bDoHeadTurn = TRUE ;
						WaitForAbsoluteTime( i+= 0.7 );
					ACTION_ClearLookAtTargetDirect( AP_Boyd );
					ACTION_ClearLookAtTargetDirect( AP_Campbell );

					ACTION_DisplaySubTitleMessage2( S_Localize("PADDOCK_E2"), 1.7 , 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 1.75 /----- PADDOCK_E2="Paddock: See? I can do it."

						WaitForAbsoluteTime( i+= 2.2 );

				}

				ACTION_PlayLipSyncSoundDirect( AP_COLE , "D00_0230.COLE_B", 1.0, 1.0, 1.0, ,'bottom_lip' );
				ACTION_DisplaySubTitleMessage2( S_Localize("COLE_B"), 1.7 , 1 , 1 , 1 , TRUE, TRUE );
					//-----/ 1.74 /----- COLE_B="Cole: Get your asses over here boys."

					WaitForAbsoluteTime( i+= 1.7 );

			//===== OBJECTIVE 1 COMPLETE
				ACTION_TriggerEvent( 'WP_obj1' );
				ACTION_SetObjectiveStatus( 1, OI_Complete, 'ObjectiveList' );

					WaitForAbsoluteTime( i+= 2.0 );

		//===== PLAYER IS LOCKED DOWN
					i=0.0;
					ResetAbsoluteTime();
					StartAbsoluteTime();

			if( AP_Paddock.Health > 0 )
				{
					ACTION_SetLookAtTargetDirect( AP_Cole , LT_Midtro_05 , TRUE );
					AP_Cole.bDoHeadTurn = TRUE ;
					ACTION_PlayLipSyncSoundDirect( AP_COLE , "D00_0230.COLE_C", 1.0, 1.0, 1.0, ,'bottom_lip' );
					ACTION_DisplaySubTitleMessage2( S_Localize("COLE_C") , 1.8 , 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 1.74 /----- COLE_C="Cole: Where are you paratroopers from?"

						WaitForAbsoluteTime( i+= 0.5);
					ACTION_SetLookAtTargetDirect( AP_Doyle , LT_Midtro_02 , TRUE );
					AP_Doyle.bDoHeadTurn = TRUE ;
						WaitForAbsoluteTime( i+= 0.2);
					ACTION_SetLookAtTargetDirect( AP_Paddock , LT_Midtro_01 , TRUE );
					AP_Paddock.bDoHeadTurn = TRUE ;
						WaitForAbsoluteTime( i+= 0.3);
					ACTION_SetLookAtTargetDirect( AP_Cole , LT_Midtro_03 , TRUE );
						WaitForAbsoluteTime( i+= 1.2);

					ACTION_TriggerEvent( 'Event_SS_Paddock_Kansas' );
					ACTION_PlayLipSyncSoundDirect( AP_PADDOCK , "D00_0230.PADDOCK_F", 1.0, 1.0, 1.0, ,'bottom_lip' );
					ACTION_DisplaySubTitleMessage2( S_Localize("PADDOCK_F"), 0.8, 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 0.71 /----- PADDOCK_F="Paddock: Kansas sir!" 

						WaitForAbsoluteTime( i+= 0.3 );
					ACTION_SetLookAtTargetDirect( AP_Paddock , AP_Cole , TRUE );
						WaitForAbsoluteTime( i+= 0.4 );
					ACTION_SetLookAtTargetDirect( AP_Cole , AP_Paddock , TRUE );
						WaitForAbsoluteTime( i+= 0.2 );
					ACTION_SetLookAtTargetDirect( AP_Doyle , LT_Midtro_Center , TRUE );
						WaitForAbsoluteTime( i+= 1.0 );

					if( AP_Doyle.Health > 0 )
						{
							ACTION_SetLookAtTargetDirect( AP_Doyle , AP_Paddock , TRUE );
							ACTION_PlayLipSyncSoundDirect( AP_DOYLE , "D00_0230.DOYLE_G", 1.0, 1.0, 1.0, ,'bottom_lip' );
							ACTION_DisplaySubTitleMessage2( S_Localize("DOYLE_G"), 1.3 , 1 , 1 , 1 , TRUE , TRUE );
								//-----/ 1.29 /----- DOYLE_G="Doyle: He means what unit."

								WaitForAbsoluteTime( i+= 0.4 );
							ACTION_SetLookAtTargetDirect( AP_Paddock , AP_Doyle , TRUE );
								WaitForAbsoluteTime( i+= 0.3 );
							ACTION_SetLookAtTargetDirect( AP_Cole , LT_Midtro_05 , TRUE );
								WaitForAbsoluteTime( i+= 1.2 );
						}

					ACTION_SetLookAtTargetDirect( AP_Paddock , LT_Midtro_Center , TRUE );
					ACTION_PlayLipSyncSoundDirect( AP_PADDOCK , "D00_0230.PADDOCK_G", 1.0, 1.0, 1.0, ,'bottom_lip' );
					ACTION_DisplaySubTitleMessage2( S_Localize("PADDOCK_G"), 4.5 , 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 4.55 /----- PADDOCK_G="Paddock: Oh, 101st F company.  I'm 2nd squad-     -He's 3rd."

						WaitForAbsoluteTime( i+= 0.4 );
							ACTION_SetLookAtTargetDirect( AP_Paddock , AP_Cole , TRUE );
						WaitForAbsoluteTime( i+= 0.2 );
							ACTION_SetLookAtTargetDirect( AP_Cole , AP_Paddock , TRUE );
						WaitForAbsoluteTime( i+= 1.6 );
							ACTION_SetLookAtTargetDirect( AP_Doyle , LT_Midtro_Center , TRUE );
						WaitForAbsoluteTime( i+= 0.3 );
							ACTION_SetLookAtTargetDirect( AP_Paddock , GetLocalPlayerPawn() , TRUE );
						WaitForAbsoluteTime( i+= 0.8 );
							ACTION_SetLookAtTargetDirect( AP_Cole , GetLocalPlayerPawn() , TRUE );
						WaitForAbsoluteTime( i+= 0.7 );
							ACTION_SetLookAtTargetDirect( AP_Paddock , LT_Midtro_01 , TRUE );
						WaitForAbsoluteTime( i+= 0.9 );
							ACTION_SetLookAtTargetDirect( AP_Cole , LT_Midtro_04 , TRUE );

					if( AP_Doyle.Health > 0 )
						{
							ACTION_PlayLipSyncSoundDirect( AP_DOYLE, "D00_0230.DOYLE_H", 1.0, 1.0, 1.0, ,'bottom_lip' );
							ACTION_DisplaySubTitleMessage2( S_Localize("DOYLE_H"), 3.2 , 1 , 1 , 1 , TRUE , TRUE );
								//-----/ 3.13 /----- DOYLE_H="Doyle: I'm 82nd, can't seem to find anyone from my unit."
						}

						WaitForAbsoluteTime( i+= 0.3 );
							ACTION_SetLookAtTargetDirect( AP_Doyle , AP_Cole , TRUE );
						WaitForAbsoluteTime( i+= 0.6 );
							ACTION_SetLookAtTargetDirect( AP_Paddock , LT_Midtro_06 , TRUE );
						WaitForAbsoluteTime( i+= 1.2 );
							ACTION_SetLookAtTargetDirect( AP_Cole , LT_Midtro_Center , TRUE );
						WaitForAbsoluteTime( i+= 0.7 );
							ACTION_SetLookAtTargetDirect( AP_Doyle , LT_Midtro_01 , TRUE );
						WaitForAbsoluteTime( i+= 1.3 );
							ACTION_SetLookAtTargetDirect( AP_Paddock , LT_Midtro_01 , TRUE );

					ACTION_TriggerEvent( 'Event_SS_Cole_Son' );
					ACTION_SetLookAtTargetDirect( AP_Cole , AP_Doyle , TRUE );
					ACTION_PlayLipSyncSoundDirect( AP_COLE , "D00_0230.COLE_D", 1.0, 1.0, 1.0, ,'bottom_lip' );
					ACTION_DisplaySubTitleMessage2( S_Localize("COLE_D"), 3.9 , 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 3.87 /----- COLE_D="Cole: Well son that don't matter now, you stick with me.  We're headed towards the battery."

						WaitForAbsoluteTime( i+= 0.4 );
					ACTION_SetLookAtTargetDirect( AP_Doyle , AP_Cole , TRUE );
						WaitForAbsoluteTime( i+= 0.3 );
					ACTION_SetLookAtTargetDirect( AP_Paddock , AP_Cole , TRUE );
						WaitForAbsoluteTime( i+= 0.9 );
					ACTION_SetLookAtTargetDirect( AP_Cole , LT_Midtro_06 , TRUE );
						WaitForAbsoluteTime( i+= 1.6 );
					ACTION_SetLookAtTargetDirect( AP_Doyle , LT_Midtro_02 , TRUE );
						WaitForAbsoluteTime( i+= 1.2 );
				}

				ACTION_PlayLipSyncSoundDirect( AP_Outro_Convoy_02_Horse , "D00_0230_SOUNDS.HORSE_APPROACH", 1.0, 1.0, 1.0 );
				ACTION_TriggerEvent( 'Event_SS_Campbell_02_Wave' );
				ACTION_PlayLipSyncSoundDirect( AP_Campbell , "D00_0230.CAMPBELL_A", 1.0, 1.0, 1.0, ,'bottom_lip' );
				ACTION_DisplaySubTitleMessage2( S_Localize("CAMPBELL_A"), 2.6 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 2.61 /----- CAMPBELL_A="Campbell: Sir, I hear some horses coming down the road."

					WaitForAbsoluteTime( i+= 0.3 );
				ACTION_SetLookAtTargetDirect( AP_Cole , AP_Campbell , TRUE );
					WaitForAbsoluteTime( i+= 0.2 );
				ACTION_SetLookAtTargetDirect( AP_Paddock , AP_Campbell , TRUE );
					WaitForAbsoluteTime( i+= 0.5 );
				ACTION_SetLookAtTargetDirect( AP_Doyle , AP_Campbell , TRUE );
					WaitForAbsoluteTime( i+= 1.1 );
				ACTION_SetLookAtTargetDirect( AP_Cole , LT_Midtro_04 , TRUE );
					WaitForAbsoluteTime( i+= 0.7 );
				ACTION_SetLookAtTargetDirect( AP_Paddock , AP_Doyle , TRUE );
					WaitForAbsoluteTime( i+= 0.4 );
				ACTION_SetLookAtTargetDirect( AP_Doyle , LT_Midtro_03 , TRUE );

				ACTION_SetLookAtTargetDirect( AP_Cole , AP_Campbell , TRUE );
					AP_Cole.bDoHeadTurn = TRUE ;
				ACTION_PlayLipSyncSoundDirect( AP_COLE , "D00_0230.COLE_E", 1.0, 1.0, 1.0, ,'bottom_lip' );
				ACTION_DisplaySubTitleMessage2( S_Localize("COLE_E"), 1.8 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 1.82 /----- COLE_E="Cole: Shut the hell up and stay quiet."

					WaitForAbsoluteTime( i+= 0.3 );
				ACTION_SetLookAtTargetDirect( AP_Paddock , LT_Midtro_01 , TRUE );
					WaitForAbsoluteTime( i+= 0.5 );
				ACTION_SetLookAtTargetDirect( AP_Doyle , AP_Cole , TRUE );
					WaitForAbsoluteTime( i+= 0.6 );
				ACTION_SetLookAtTargetDirect( AP_Cole , LT_Midtro_04 , TRUE );
					WaitForAbsoluteTime( i+= 1.0 );

			if( AP_Paddock.Health > 0 )
				{
					ACTION_SetLookAtTargetDirect( AP_Paddock , AP_Cole , TRUE );
					ACTION_TriggerEvent( 'Event_SS_Paddock_Horses' );
					ACTION_PlayLipSyncSoundDirect( AP_PADDOCK , "D00_0230.PADDOCK_H", 1.0, 1.0, 1.0, ,'bottom_lip' );
					ACTION_DisplaySubTitleMessage2( S_Localize("PADDOCK_H"), 2.0 , 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 1.08 /----- PADDOCK_H="Paddock: did he say horses?"

						WaitForAbsoluteTime( i+= 0.2 );
					ACTION_SetLookAtTargetDirect( AP_Cole , LT_Midtro_04 , TRUE );
						WaitForAbsoluteTime( i+= 0.7 );
					ACTION_SetLookAtTargetDirect( AP_Doyle , AP_Paddock , TRUE );
						WaitForAbsoluteTime( i+= 0.5 );
				}

				ACTION_TriggerEvent( 'Event_SS_Campbell_Wave' );
				ACTION_SetLookAtTargetDirect( AP_Paddock , AP_Campbell , TRUE );
				ACTION_PlayLipSyncSoundDirect( AP_Outro_Convoy_01_Horse , "D00_0230.GERMAN_C", 1.0, 1.0, 1.0, ,'bottom_lip' );
				ACTION_DisplaySubTitleMessage2( S_Localize("GERMAN_C"), 2.4 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/----- GERMAN_C="German: Halt! Ruhig! Ich habe etwas gehört!"

					WaitForAbsoluteTime( i+ 1.4 );
				ACTION_SetLookAtTargetDirect( AP_Cole , AP_Campbell , TRUE );
					AP_Cole.bDoHeadTurn = TRUE ;
					WaitForAbsoluteTime( i+ 1.1 );
				ACTION_SetLookAtTargetDirect( AP_Doyle , LT_Midtro_04 , TRUE );
					WaitForAbsoluteTime( i+ 0.8 );
					StopAbsoluteTime();

				ACTION_PlayLipSyncSoundDirect( AP_Campbell , "D00_0230.CAMPBELL_B", 1.0, 1.0, 1.0, ,'bottom_lip' );
				ACTION_DisplaySubTitleMessage2( S_Localize("CAMPBELL_B"), 2.1 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 2.14 /----- CAMPBELL_B="Campbell: Shit sir I think they saw me!"

					sleep( 4.0 );

					i=0.0;
					ResetAbsoluteTime();
					StartAbsoluteTime();

				ACTION_TriggerEvent( 'Event_SS_Cole_Alright' );
				ACTION_PlayLipSyncSoundDirect( AP_COLE , "D00_0230.COLE_F", 1.0, 1.0, 1.0, ,'bottom_lip' );
				ACTION_DisplaySubTitleMessage2( S_Localize("COLE_F"), 2.1 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 2.01 /----- COLE_F="Cole: Alright you take the road and I'll flank 'em"				

				ACTION_TriggerEvent( 'Event_SS_Boyd_02_End' );
					sleep( 0.5 );
				ACTION_ClearLookAtTargetDirect( AP_Doyle );
				ACTION_ClearLookAtTargetDirect( AP_Paddock );
				ACTION_ClearLookAtTargetDirect( AP_Cole );
				ACTION_ClearLookAtTargetDirect( AP_Boyd );
				ACTION_ClearLookAtTargetDirect( AP_Campbell );
				ACTION_TriggerEvent( 'Event_SS_Doyle_Stand' );
				ACTION_TriggerEvent( 'Event_SS_Paddock_End' );
					sleep( 0.2 );
				ACTION_TriggerEvent( 'Event_SS_Campbell_02_End' );
					sleep( 0.3 );

				ACTION_TriggerEvent( 'BVT_Cole_Roadblock' );

			//===== Change to mind
				ACTION_OrderFallOut( 'Unit_US_Assault' );
	//			ACTION_ChangeControllerDirect( AP_Paddock ,class'Mind' );
				ACTION_RunDirect( AP_Paddock );
				ACTION_CrouchDirect( AP_Paddock );
				ACTION_RunDirect( AP_Paddock );
	//			ACTION_ChangeControllerDirect( AP_Cole ,class'Mind' );
				ACTION_RunDirect( AP_Cole );

				ACTION_AssignToUnit( 'AP_Cole' , 'UNIT_US_Cole' );

				ACTION_EnableBattleDialogueForCharacter( 'AP_Doyle' );
				ACTION_EnableBattleDialogueForCharacter( 'AP_Paddock' );

					sleep( 0.4 );	

				ACTION_SetAnimSetDirect( AP_Cole , "a_hold_rifle.a_hold_rifle" );
				ACTION_SetAnimSetDirect( AP_Doyle , "a_hold_rifle.a_hold_rifle" );
				ACTION_SetAnimSetDirect( AP_Paddock , "a_hold_rifle.a_hold_rifle" );

					sleep( 1.5 );

			if( AP_Paddock.Controller.IsA( 'ScriptedController' ))
				{
					ACTION_ChangeControllerDirect( AP_Paddock , class'Mind' );				
					ACTION_RunDirect( AP_Paddock );
				}

		//========== CHECKPOINT 03
				ACTION_DestroyActor( 'gbxTrig_Midtro_Lock' );
				ACTION_TriggerEvent('TS_Checkpoint3Save');
				ACTION_TriggerEvent( 'Event_Midtro_Unlock' );

					sleep( 0.5 );

			if( AP_Doyle.Controller.IsA( 'ScriptedController' ))
				{
					ACTION_ChangeControllerDirect( AP_Doyle , class'Mind' );				
					ACTION_RunDirect( AP_Doyle );
				}

				ACTION_TriggerEvent( 'Event_SS_Midtro_Horse_Run' );
				ACTION_TriggerEvent( 'TS_D000230_CartCrash' );

					sleep( 5.0 );

				ACTION_OrderMove( 'UNIT_US_Cole' , 'PN_Cole_Unit_Setup' );

//=============================================================================
		//===== DIALOGUE - BAKER & MARSHALL 

				ACTION_ForcePlayerDismountTurret();
				ACTION_UnBlockActionKeys( KEY_ACTION_CROUCH  );
				GetLocalPlayerPawn().ForceUnCrouch(); 

				GetLocalplayerController().EnableSoundCategory( ESoundCategory.SC_AMBIENT , false , 1.5 );	
				GetLocalplayerController().EnableSoundCategory( ESoundCategory.SC_CINEMATIC , false , 1.5 );
		//		GetLocalplayerController().EnableSoundCategory( ESoundCategory.SC_SOUNDFX	 , false , 1.5 );	

			//===== Trigger matinee scene to slow down time and desaturate
				ACTION_TriggerEvent( 'Scene_D00_0230_Horse_Chat' );
				GetLocalPlayerController().CancelOrderIcon();  // make SURE an order isn't in progress
				ACTION_BlockActionKeys( -1 );
				ACTION_UnBlockActionKeys( KEY_ACTION_MOVE + KEY_ACTION_LOOK + KEY_ACTION_SHOW_MENU );
				ACTION_DesaturateCamera( 3000.0 );

					i=0.0;
					ResetAbsoluteTime();
					StartAbsoluteTime();

					WaitForAbsoluteTime( i+=0.10 );

				ACTION_PlayLocalSound( "D00_0230.MARSHALL_C" );
				ACTION_DisplaySubTitleMessage2( S_Localize("MARSHALL_C"), 0.1 , 1, 1, 1, TRUE, TRUE );
					//-----/ 1.02 /----- MARSHALL_C="Marshall: Were you scared?"	

					WaitForAbsoluteTime( i+=0.16 );

				ACTION_PlayLocalSound( "D00_0230.HARTSOCK_D" );
				ACTION_DisplaySubTitleMessage2( S_Localize("HARTSOCK_D"), 0.32 , 1, 1, 1, TRUE, TRUE );
					//-----/ 3.17 /----- HARTSOCK_D="Hartsock: That was the first time in the war I got the impression I was about to die."

					WaitForAbsoluteTime( i+=0.41 );

				ACTION_PlayLocalSound( "D00_0230.MARSHALL_D" );
				ACTION_DisplaySubTitleMessage2( S_Localize("MARSHALL_D"), 0.11 , 1, 1, 1, TRUE, TRUE );
					//-----/ 1.12 /----- MARSHALL_D="Marshall: Why do you say that?"

					WaitForAbsoluteTime( i+=0.16 );

				ACTION_PlayLocalSound( "D00_0230.HARTSOCK_E" );
				ACTION_DisplaySubTitleMessage2( S_Localize("HARTSOCK_E1"), 0.4 , 1, 1, 1, TRUE, TRUE );
					//-----/ 4.00 /----- HARTSOCK_E1="Hartsock: I dunno, something about the horses maybe."

					WaitForAbsoluteTime( i+=0.47 );

				ACTION_DisplaySubTitleMessage2( S_Localize("HARTSOCK_E2"), 0.42 , 1, 1, 1, TRUE, TRUE );
					//-----/ 4.25 /----- HARTSOCK_E2="Hartsock: I've had bad experiences with horses."
	
					WaitForAbsoluteTime( i+=0.52 );

					StopAbsoluteTime();

			//===== Trigger matinee scene to bring time back to normal speed and remove saturation
				ACTION_StopScene( 'Scene_D00_0230_Horse_Chat' , 'Scene_D00_0230_Horse_End' );
				ACTION_UnBlockActionKeys( -1 );
				ACTION_EndDesaturateCamera();

				GetLocalplayerController().EnableSoundCategory( ESoundCategory.SC_AMBIENT , true , 1.5 );	
				GetLocalplayerController().EnableSoundCategory( ESoundCategory.SC_CINEMATIC , true , 1.5 );
		//		GetLocalplayerController().EnableSoundCategory( ESoundCategory.SC_SOUNDFX	 , true , 1.5 );	

//=============================================================================

				ACTION_TriggerEvent( 'BVT_Horse_Clip' );

					sleep( 0.5 );

				ACTION_TriggerEvent('TS_Objectives');

			//===== Start combat
				ACTION_TriggerEvent( 'CSG_C201' );

				ACTION_TriggerEvent( 'TS_D000230_Training_Reload' );
				ACTION_TriggerEvent( 'TS_D000230_Training_Reload_Check' );

				ACTION_WaitForEvent( 'Event_Final_Combat_Complete' );

				sleep( 0.2 );

			//===== Area clear as said by TS_Combat_2A
				ACTION_TriggerEvent( 'WP_obj2' );
				ACTION_SetObjectiveStatus( 2, OI_Complete, 'ObjectiveList' );
					sleep( 2.0 );

				ACTION_TriggerEvent('TS_Objectives');
				ACTION_TriggerEvent('TS_D000230_Outro');
	
	}
