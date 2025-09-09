//=============================================================================
// TS_D10_0800_IntroScene.
//=============================================================================
class TS_D10_0800_IntroScene extends TriggeredScript
	placeable;

var float i;
var ActorLite Dest_Doyle , Dest_Paige ;
var Actor LT_Intro_01 , LT_Intro_02 , LT_Intro_03 , LT_Intro_04 , LT_Intro_05 , LT_Intro_06 , LT_Intro_07 , LT_Intro_08 , LT_Intro_09 , LT_Intro_Center ;
var AnimPawn AP_Hartsock, AP_Doyle,  AP_Marsh,  AP_McConnel,  AP_Paige, AP_Paddock, AP_Friar, AP_Campbell;
var Actor LT_Intro_Run_Focus ;
var int Doyle_Random , Paige_Random ;

state Triggered
	{

			function OnTrigger()
				{
					GotoState( 'Dialogue' );
				}

		Begin:

				ACTION_TriggerEvent('D10_0800_RainScript');

			//===== Spawn intro characters
				ACTION_TriggerEvent( 'CSU_IntroCharacters' );

			//===== Define Characters as AnimPawn Actors
				AP_Paddock = AnimPawn( GetPawn( 'AP_Paddock' ));
				AP_Doyle = AnimPawn( GetPawn( 'AP_Doyle' ));
				AP_Friar = AnimPawn( GetPawn( 'AP_Friar' ));
				AP_Campbell = AnimPawn( GetPawn( 'AP_Campbell' ));
				AP_Marsh = AnimPawn( GetPawn( 'AP_Marsh' ));
				AP_McConnel = AnimPawn( GetPawn( 'AP_McConnel' ));
				AP_Paige = AnimPawn( GetPawn( 'AP_Paige' ));

				LT_Intro_01 = GetFirstActor( 'LT_Intro_01' );
				LT_Intro_02 = GetFirstActor( 'LT_Intro_02' );
				LT_Intro_03 = GetFirstActor( 'LT_Intro_03' );
				LT_Intro_04 = GetFirstActor( 'LT_Intro_04' );
				LT_Intro_05 = GetFirstActor( 'LT_Intro_05' );
				LT_Intro_06 = GetFirstActor( 'LT_Intro_06' );
				LT_Intro_07 = GetFirstActor( 'LT_Intro_07' );
				LT_Intro_08 = GetFirstActor( 'LT_Intro_08' );
				LT_Intro_09 = GetFirstActor( 'LT_Intro_09' );
				LT_Intro_Center = GetFirstActor( 'LT_Intro_Center' );

				Dest_Doyle = GetNavigationPoint( 'PN_Intro_Doyle' );
				Dest_Paige = GetNavigationPoint( 'PN_Intro_Paige' );

			//===== Set up intro character animations
				ACTION_TriggerEvent( 'Event_SS_Intro_Setup' );

				ACTION_TriggerEvent( 'TS_D10_0800_Intro_Marsh' );
				ACTION_TriggerEvent( 'TS_D10_0800_Intro_McConnel' );

				ACTION_PawnSetHeadTurnMult( 'AP_Doyle' , 0.4 );
				ACTION_PawnSetHeadTurnMult( 'AP_Friar' , 0.6 );
				ACTION_PawnSetHeadTurnMult( 'AP_Paddock' , 0.7 );
				ACTION_PawnSetHeadTurnMult( 'AP_Paige' , 0.5 );

				ACTION_SetLookAtTargetDirect( AP_Doyle , AP_Paige , TRUE );
				ACTION_SetLookAtTargetDirect( AP_Friar , LT_Intro_Center , TRUE );
				ACTION_SetLookAtTargetDirect( AP_Paige , AP_Friar , TRUE );

				ACTION_BlockNavPoints( 'PN_Intro_Doyle_Funnel' );
				ACTION_EnableBattleDialogue();
			}

state Dialogue
	{
		Begin:

			//===== Start dialogue

				i = 0.0;

				ACTION_StartRain( 1 );

				ResetAbsoluteTime();
				StartAbsoluteTime();

				ACTION_SetLookAtTargetDirect( AP_Paddock , LT_Intro_02 , TRUE );
				AP_Paddock.bDoHeadTurn = TRUE ;

				WaitForAbsoluteTime( i );

					WaitForAbsoluteTime( i+= 1.0 );

			//-----/-----	EXT. ST. SAVEUR - MORNING
			//-----/-----	DOYLE and HARTSOCK  and the rest of the men find
			//-----/-----	themselves on a dirt road staring at a city.  The city is in
			//-----/-----	absolute ruin, flaming and smoking for miles.

			//-----/ 2.25 /-----PADDOCK_AA_1="Paddock: Holy shit, look at this place."
				ACTION_TriggerEvent( 'Event_SS_Intro_Paddock_Holy' );
				ACTION_PlayLipSyncSoundDirect( AP_Paddock , "D10_0800.PADDOCK_AA" , 1.0, 1.0, 1.0 );
				ACTION_DisplaySubtitleMessage2(S_Localize( "PADDOCK_AA_1" ), 2.3 , 1 , 1 , 1 , , TRUE );
					WaitForAbsoluteTime( i+= 0.3 );
				ACTION_SetLookAtTargetDirect( AP_Paige , AP_Paddock , TRUE );
					WaitForAbsoluteTime( i+= 0.1 );
				ACTION_SetLookAtTargetDirect( AP_Paddock , AP_Paige , TRUE );
					WaitForAbsoluteTime( i+= 0.2 );
				ACTION_SetLookAtTargetDirect( AP_Friar , AP_Paddock , TRUE );
					WaitForAbsoluteTime( i+= 0.1 );
				ACTION_SetLookAtTargetDirect( AP_Paddock , AP_Friar , TRUE );
					WaitForAbsoluteTime( i+= 0.3 );
				ACTION_SetLookAtTargetDirect( AP_Doyle , AP_Paddock , TRUE );
					WaitForAbsoluteTime( i+= 0.1 );
				ACTION_SetLookAtTargetDirect( AP_Paige , LT_Intro_02 , TRUE );
					WaitForAbsoluteTime( i+= 0.8 );
				ACTION_SetLookAtTargetDirect( AP_Friar , LT_Intro_01 , TRUE );
					WaitForAbsoluteTime( i+= 0.3 );
				ACTION_SetLookAtTargetDirect( AP_Doyle , LT_Intro_03 , TRUE );
					WaitForAbsoluteTime( i+= 0.4 );

			//-----/ 2.10 /-----PADDOCK_AA_2="Paddock: You sure this is where we’re supposed to be?"
				ACTION_DisplaySubtitleMessage2(S_Localize( "PADDOCK_AA_2" ), 2.1 , 1 , 1 , 1 , , TRUE );
					WaitForAbsoluteTime( i+= 0.6 );
				ACTION_SetLookAtTargetDirect( AP_Paddock , GetLocalPlayerPawn() , TRUE );
					WaitForAbsoluteTime( i+= 0.4 );
				ACTION_SetLookAtTargetDirect( AP_Friar , LT_Intro_01 , TRUE );
					WaitForAbsoluteTime( i+= 0.2 );
				ACTION_SetLookAtTargetDirect( AP_Paige , AP_Doyle , TRUE );
					WaitForAbsoluteTime( i+= 0.2 );
				ACTION_SetLookAtTargetDirect( AP_Doyle , LT_Intro_Center , TRUE );
					WaitForAbsoluteTime( i+= 0.1 );
				ACTION_TriggerEvent( 'Event_SS_Intro_McConnel_Dismount' );
					WaitForAbsoluteTime( i+= 0.2 );
				ACTION_SetLookAtTargetDirect( AP_Friar , LT_Intro_07 , TRUE );
					WaitForAbsoluteTime( i+= 0.3 );
				ACTION_SetLookAtTargetDirect( AP_Paddock , AP_Doyle , TRUE );
					WaitForAbsoluteTime( i+= 0.1 );
				ACTION_SetLookAtTargetDirect( AP_Doyle , AP_Friar , TRUE );
					WaitForAbsoluteTime( i+= 0.2 );
				ACTION_SetLookAtTargetDirect( AP_Paige , GetLocalPlayerPawn() , TRUE );
					WaitForAbsoluteTime( i+= 0.1 );
				ACTION_TriggerEvent( 'Event_SS_Intro_Marsh_Dismount' );
					WaitForAbsoluteTime( i+= 0.3 );

			//-----/ 7.66 /-----FRIAR_AA="Friar: We must have bombed it to the flush out the Germans.  But since they haven’t exactly packed up and left, I’m gonna guess they ain’t going to just hand it over."
				ACTION_TriggerEvent( 'Event_SS_Intro_Friar_Boring' );
				ACTION_PlayLipSyncSoundDirect( AP_Friar , "D10_0800.FRIAR_AA", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubtitleMessage2(S_Localize( "FRIAR_AA" ), 7.6 , 1 , 1 , 1 , , TRUE );
					WaitForAbsoluteTime( i+= 1.1 );
				ACTION_SetLookAtTargetDirect( AP_Friar , GetLocalPlayerPawn() , TRUE );
					WaitForAbsoluteTime( i+= 1.3 );
				ACTION_SetLookAtTargetDirect( AP_Paige , AP_Friar , TRUE );
					WaitForAbsoluteTime( i+= 0.9 );
				ACTION_SetLookAtTargetDirect( AP_Doyle , GetLocalPlayerPawn() , TRUE );
					WaitForAbsoluteTime( i+= 0.5 );
				ACTION_SetLookAtTargetDirect( AP_Paddock , LT_Intro_03 , TRUE );
					WaitForAbsoluteTime( i+= 1.5 );
				ACTION_SetLookAtTargetDirect( AP_Friar , AP_Paige , TRUE );
					WaitForAbsoluteTime( i+= 0.4 );
				ACTION_SetLookAtTargetDirect( AP_Doyle , LT_Intro_09 , TRUE );
					WaitForAbsoluteTime( i+= 0.2 );
				ACTION_SetLookAtTargetDirect( AP_Paige , LT_Intro_Center , TRUE );
					WaitForAbsoluteTime( i+= 0.5 );
				ACTION_SetLookAtTargetDirect( AP_Paddock , LT_Intro_05 , TRUE );
					WaitForAbsoluteTime( i+= 1.9 );

			//-----/ 3.43 /-----DOYLE_CC="Doyle: That's the mission.  Sorry boys."
				ACTION_TriggerEvent( 'Event_SS_Intro_Doyle_Sorry' );
				ACTION_PlayLipSyncSoundDirect( AP_Doyle , "D10_0800.DOYLE_CC", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubtitleMessage2(S_Localize( "DOYLE_CC" ), 3.4 , 1 , 1 , 1 , , TRUE );
					WaitForAbsoluteTime( i+= 0.2 );
				ACTION_SetLookAtTargetDirect( AP_Doyle , AP_Paige , TRUE );
					WaitForAbsoluteTime( i+= 0.2 );
				ACTION_SetLookAtTargetDirect( AP_Friar , AP_Doyle , TRUE );
					WaitForAbsoluteTime( i+= 0.3 );
				ACTION_SetLookAtTargetDirect( AP_Paige , LT_Intro_08 , TRUE );
					WaitForAbsoluteTime( i+= 0.2 );
				ACTION_SetLookAtTargetDirect( AP_Doyle , AP_Friar , TRUE );
					WaitForAbsoluteTime( i+= 0.4 );
				ACTION_SetLookAtTargetDirect( AP_Paddock , LT_Intro_Center , TRUE );
					WaitForAbsoluteTime( i+= 0.3 );
				ACTION_SetLookAtTargetDirect( AP_Friar , LT_Intro_Center , TRUE );
					WaitForAbsoluteTime( i+= 0.2 );
				ACTION_SetLookAtTargetDirect( AP_Paige , GetLocalPlayerPawn() , TRUE );
					WaitForAbsoluteTime( i+= 0.5 );
				ACTION_SetLookAtTargetDirect( AP_Paddock , LT_Intro_02 , TRUE );
					WaitForAbsoluteTime( i+= 0.2 );
				ACTION_SetLookAtTargetDirect( AP_Doyle , LT_Intro_01 , TRUE );
					WaitForAbsoluteTime( i+= 0.4 );
				ACTION_TriggerEvent( 'Event_SS_Intro_Paddock_Crazy' );

			//-----/ 4.93 /-----PADDOCK_BB="Paddock: Well I guess if you guys are all feeling crazy enough to go in there... then I am too."
				ACTION_PlayLipSyncSoundDirect( AP_Paddock , "D10_0800.PADDOCK_BB", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubtitleMessage2(S_Localize( "PADDOCK_BB" ), 4.9 , 1 , 1 , 1 , , TRUE );
					WaitForAbsoluteTime( i+= 0.3 );
				ACTION_SetLookAtTargetDirect( AP_Paddock , AP_Paige , TRUE );
					WaitForAbsoluteTime( i+= 0.4 );
				ACTION_SetLookAtTargetDirect( AP_Paige , AP_Paddock , TRUE );
					WaitForAbsoluteTime( i+= 0.2 );
				ACTION_SetLookAtTargetDirect( AP_Friar , LT_Intro_08 , TRUE );
					WaitForAbsoluteTime( i+= 0.3 );
				ACTION_SetLookAtTargetDirect( AP_Doyle , AP_Paddock , TRUE );
					WaitForAbsoluteTime( i+= 0.5 );
				ACTION_SetLookAtTargetDirect( AP_Paddock , GetLocalPlayerPawn() , TRUE );
					WaitForAbsoluteTime( i+= 0.6 );
				ACTION_SetLookAtTargetDirect( AP_Paige , AP_Friar , TRUE );
					WaitForAbsoluteTime( i+= 0.5 );
				ACTION_SetLookAtTargetDirect( AP_Doyle , GetLocalPlayerPawn() , TRUE );
					WaitForAbsoluteTime( i+= 0.6 );
				ACTION_SetLookAtTargetDirect( AP_Paddock , AP_Friar , TRUE );
					WaitForAbsoluteTime( i+= 0.7 );
				ACTION_SetLookAtTargetDirect( AP_Friar , LT_Intro_05 , TRUE );
					WaitForAbsoluteTime( i+= 0.4 );
				ACTION_SetLookAtTargetDirect( AP_Paddock , GetLocalPlayerPawn() , TRUE );
					WaitForAbsoluteTime( i+= 0.9 );

			//-----/ 4.90 /-----PAIGE_DD="Paige: We said we’d help you out and all but Christ Almighty Doyle... we go in there we aren't coming back out."
				ACTION_SetLookAtTargetDirect( AP_Paige , AP_Doyle , TRUE );
				ACTION_TriggerEvent( 'Event_SS_Intro_Paige_Help' );
				ACTION_PlayLipSyncSoundDirect( AP_Paige , "D10_0800.PAIGE_DD", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubtitleMessage2(S_Localize( "PAIGE_DD" ), 4.9 , 1 , 1 , 1 , , TRUE );
					WaitForAbsoluteTime( i+= 0.5 );
				ACTION_SetLookAtTargetDirect( AP_Friar , AP_Paige , TRUE );
					WaitForAbsoluteTime( i+= 0.2 );
				ACTION_SetLookAtTargetDirect( AP_Doyle , AP_Paige , TRUE );
					WaitForAbsoluteTime( i+= 0.4 );
				ACTION_SetLookAtTargetDirect( AP_Paddock , LT_Intro_03 , TRUE );
					WaitForAbsoluteTime( i+= 0.3 );
				ACTION_SetLookAtTargetDirect( AP_Friar , AP_Doyle , TRUE );
					WaitForAbsoluteTime( i+= 0.4 );
				ACTION_SetLookAtTargetDirect( AP_Paddock , LT_Intro_06 , TRUE );
					WaitForAbsoluteTime( i+= 0.7 );
				ACTION_SetLookAtTargetDirect( AP_Doyle , LT_Intro_Center , TRUE );
					WaitForAbsoluteTime( i+= 0.6 );
				ACTION_SetLookAtTargetDirect( AP_Paddock , AP_Paige , TRUE );
					WaitForAbsoluteTime( i+= 0.4 );
				ACTION_SetLookAtTargetDirect( AP_Paige , LT_Intro_01 , TRUE );
					WaitForAbsoluteTime( i+= 0.5 );
				ACTION_SetLookAtTargetDirect( AP_Paige , GetLocalPlayerPawn() , TRUE );
					WaitForAbsoluteTime( i+= 0.2 );
				ACTION_SetLookAtTargetDirect( AP_Friar , LT_Intro_01 , TRUE );
					WaitForAbsoluteTime( i+= 0.3 );
				ACTION_SetLookAtTargetDirect( AP_Paige , LT_Intro_Center , TRUE );
					WaitForAbsoluteTime( i+= 0.7 );
				ACTION_SetLookAtTargetDirect( AP_Doyle , AP_Paddock , TRUE );
					WaitForAbsoluteTime( i+= 0.4 );

			//-----/ 6.50 /-----DOYLE_DD="Doyle: Then it was a pleasure knowing you all.  Whoever makes it to the other side alive... Wins."
				ACTION_TriggerEvent( 'Event_SS_Intro_Doyle_Pleasure' );
				ACTION_PlayLipSyncSoundDirect( AP_Doyle , "D10_0800.DOYLE_DD", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubtitleMessage2(S_Localize( "DOYLE_DD" ), 6.50 , 1 , 1 , 1 , , TRUE );
					WaitForAbsoluteTime( i+= 0.6 );
				ACTION_SetLookAtTargetDirect( AP_Paige , AP_Doyle , TRUE );
					WaitForAbsoluteTime( i+= 0.3 );
				ACTION_SetLookAtTargetDirect( AP_Friar , LT_Intro_03 , TRUE );
					WaitForAbsoluteTime( i+= 0.4 );
				ACTION_SetLookAtTargetDirect( AP_Doyle , AP_Paige , TRUE );
					WaitForAbsoluteTime( i+= 0.1 );
				ACTION_SetLookAtTargetDirect( AP_Paddock , LT_Intro_03 , TRUE );
					WaitForAbsoluteTime( i+= 0.4 );
				ACTION_SetLookAtTargetDirect( AP_Friar , AP_Doyle , TRUE );
					WaitForAbsoluteTime( i+= 0.7 );
				ACTION_SetLookAtTargetDirect( AP_Paige , AP_Paddock , TRUE );
					WaitForAbsoluteTime( i+= 0.4 );
				ACTION_SetLookAtTargetDirect( AP_Paddock , LT_Intro_02 , TRUE );
					WaitForAbsoluteTime( i+= 0.3 );
				ACTION_SetLookAtTargetDirect( AP_Doyle , GetLocalPlayerPawn() , TRUE );
					WaitForAbsoluteTime( i+= 0.2 );
				ACTION_SetLookAtTargetDirect( AP_Paige , AP_Friar , TRUE );
					WaitForAbsoluteTime( i+= 0.1 );
				ACTION_SetLookAtTargetDirect( AP_Friar , GetLocalPlayerPawn() , TRUE );
					WaitForAbsoluteTime( i+= 0.7 );
				ACTION_SetLookAtTargetDirect( AP_Paddock , LT_Intro_06 , TRUE );
					WaitForAbsoluteTime( i+= 0.4 );
				ACTION_ClearLookAtTargetDirect( AP_Paddock );
				ACTION_TriggerEvent( 'Event_SS_Intro_Exit_Paddock' );
					WaitForAbsoluteTime( i+= 2.3 );
					StopAbsoluteTime();

				ACTION_ClearLookAtTargetDirect( AP_Doyle );
				ACTION_ClearLookAtTargetDirect( AP_Friar );
				ACTION_ClearLookAtTargetDirect( AP_Marsh );
				ACTION_ClearLookAtTargetDirect( AP_McConnel );

				ACTION_ClearLookAtTargetDirect( AP_Paige );

			//-----/----- DOYLE runs off to the left with his men.  HARTSOCK is left with his tank and PADDOCK, FRIAR, and CAMPBELL.

			//===== Move Doyle and Paige off
					sleep( 0.6 );
				ACTION_DisableBattleDialogueForCharacter('AP_Paige');
				ACTION_TriggerEvent( 'Event_SS_Intro_Exit_Paige' );
						sleep( 0.2 );
				ACTION_DisableBattleDialogueForCharacter('AP_Paige');
				ACTION_OrderMove( 'Unit_US_Doyle' , 'PN_Intro_Paige' );

					ACTION_WaitForEvent( 'Event_EndPath' );
				ACTION_UnBlockNavPoints( 'PN_Intro_Doyle_Funnel' );
				ACTION_BlockNavPoints( 'PN_Intro_Exit' );

					sleep( 0.5 );
				ACTION_TriggerEvent( 'Event_SS_Intro_Exit_Friar' );
					sleep( 3.0 );

				ACTION_DestroyActor( 'AP_Paige' );
				ACTION_DestroyActor( 'AP_Doyle' );

		//========== GRADUALLY RELEASE THE PLAYER'S SQUADMATES
				ACTION_TriggerEvent( 'Event_SS_Intro_Marsh_Dismount' );
					sleep( 0.3 );
				ACTION_TriggerEvent( 'Event_SS_Intro_McConnel_Dismount' );
					sleep( 0.1 );
				ACTION_TriggerEvent( 'Event_SS_Intro_Campbell_Dismount' );

					sleep( 2.0 );

		//========== CHECKPOINT + RELEASE PLAYER

				ACTION_TriggerEvent( 'TriggeredScriptIntro' );

					sleep( 1.0 );

			//===== Start combat 1
				ACTION_TriggerEvent( 'TSCombat_01' );

			//===== Fakez0rz dialogue from Doyle & Paddock

						Paige_Random = Rand( 3 );

							switch ( Paige_Random ) 
								{ 
									Case 0: 
											ACTION_PlaySound( 'LT_Intro_Fake_Dialogue' , "BD_PAIGE.M_COLORDIALOG_F" , 1.0, 1.0, 8192 );
													//-----/ 2.73 /----- Paige : Oh look, more krauts, how fucking surprising!
												sleep( 2.8 );
										break; 
									Case 1: 

											ACTION_PlaySound( 'LT_Intro_Fake_Dialogue' , "BD_PAIGE.M_SEEENEMY_E" , 1.0, 1.0, 8192 );
													//-----/ 1.31 /----- Paige : Krauts!  Just up there!
												sleep( 1.4 );
										break; 
									Case 2: 

											ACTION_PlaySound( 'LT_Intro_Fake_Dialogue' , "BD_PAIGE.M_SEEENEMYSHIFT_B" , 1.0, 1.0, 8192 );
													//-----/ 1.33 /----- Paige : Those krauts are moving!
												sleep( 1.4 );
										break; 
								}

						Doyle_Random = Rand( 3 );

							switch ( Doyle_Random ) 
								{ 
									Case 0: 
											ACTION_PlaySound( 'LT_Intro_Fake_Dialogue' , "BD_DOYLE.M_HEAVYFIRE_C" , 1.0, 1.0, 8192 );
													//-----/ 1.56 /----- Doyle : Red!  This aint lookin' good!
												sleep( 1.6 );
										break; 
									Case 1: 

											ACTION_PlaySound( 'LT_Intro_Fake_Dialogue' , "BD_DOYLE.M_HORROR_A" , 1.0, 1.0, 8192 );
													//-----/ 1.30 /----- Doyle : We gotta go!
												sleep( 1.4 );
										break; 
									Case 2: 

											ACTION_PlaySound( 'LT_Intro_Fake_Dialogue' , "BD_DOYLE.M_SEEENEMY_F" , 1.0, 1.0, 8192 );
													//-----/ 0.25 /----- Doyle : Watch it!
												sleep( 0.4 );
										break; 
								}

	}

