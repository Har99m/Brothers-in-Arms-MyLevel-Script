//=============================================================================
// TS_D00_0600_IntroScene.
//=============================================================================
class TS_D00_0600_IntroScene extends TriggeredScript
	placeable;

var float i;
var AnimPawn AP_Hartsock , AP_Doyle , AP_Paddock , AP_Friar , AP_Cassidy ;
var WargamePawn Player;
var ActorLite Dest_01 , Dest_02 , Dest_03 , PN_Cassidy_Approach ;
var Actor LT_Intro_01 , LT_Intro_02 , LT_Intro_03 , LT_Intro_04 , LT_Intro_05 , LT_Intro_06 , LT_Intro_07 , LT_Intro_08 , LT_Intro_Center ;

state Triggered
	{

		Begin:
// 20.9
			//===== Initiate
					i = 0.0;

					ResetAbsoluteTime();
					StartAbsoluteTime();

					WaitForAbsoluteTime( i );

				ACTION_TriggerEvent( 'CSU_IntroCharacters' );
				ACTION_SetUnitHiddenOnCompass( 'Unit_US_Ass' , TRUE );

				ACTION_TriggerEvent( 'BVT_Church_Doyle' );

			//===== Define Characters as AnimPawn Actors

				AP_Cassidy = AnimPawn( GetPawn( 'Cassidy' ));
				AP_Doyle = AnimPawn( GetPawn( 'Doyle' ));
				AP_Friar = AnimPawn( GetPawn( 'Friar' ));
				AP_Hartsock = AnimPawn( GetPawn( 'Hartsock' ));
				AP_Paddock = AnimPawn( GetPawn( 'Paddock' ));

				PN_Cassidy_Approach = GetNavigationPoint( 'PN_Cassidy_Approach' );

				LT_Intro_01 = GetFirstActor( 'LT_Intro_01' );
				LT_Intro_02 = GetFirstActor( 'LT_Intro_02' );
				LT_Intro_03 = GetFirstActor( 'LT_Intro_03' );
				LT_Intro_04 = GetFirstActor( 'LT_Intro_04' );
				LT_Intro_05 = GetFirstActor( 'LT_Intro_05' );
				LT_Intro_06 = GetFirstActor( 'LT_Intro_06' );
				LT_Intro_07 = GetFirstActor( 'LT_Intro_07' );
				LT_Intro_08 = GetFirstActor( 'LT_Intro_08' );
				LT_Intro_Center = GetFirstActor( 'LT_Intro_Center' );

				Dest_01 = GetNavigationPoint( 'PN_Intro_Doyle_01' );
				Dest_02 = GetNavigationPoint( 'PN_Intro_Friar' );
				Dest_03 = GetNavigationPoint( 'PN_Intro_Paddock' );

				GetLocalPlayerPawn().bHidden = TRUE ;

					WaitForAbsoluteTime( i += 22.8 );

			//===== START ANIMATION RIDE 
				ACTION_TriggerEvent( 'Event_SS_Hartsock_Start' );
				ACTION_TriggerEvent( 'Event_SS_Doyle_Intro_Start' );
				ACTION_TriggerEvent( 'Event_SS_Intro_Paddock_Start' );
				ACTION_TriggerEvent( 'Event_SS_Intro_Friar_Start' );
				ACTION_TriggerEvent( 'Event_SS_Intro_Cassidy_Start' );
				ACTION_TriggerEvent( 'Scene_D00_0600_Ride_Dummy' );
				ACTION_CameraInPawnHead( 'AP_Hartsock_Intro' , 'Scene_D00_0600_Ride_Dummy' , TRUE );

			//===== RESET TIMERS
					i = 0.0;

					ResetAbsoluteTime();
					StartAbsoluteTime();

					WaitForAbsoluteTime( i );

					WaitForAbsoluteTime( i += 1.9 );

		//========== START DIALOGUE
				ACTION_PlayLipSyncSoundDirect( AP_Doyle , "D00_0600.DOYLE_A", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "DOYLE_A" ) , 2.0 , 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 1.89 /-----DOYLE_A="Doyle: Hey corporal.  Ya fall asleep?"

					WaitForAbsoluteTime( i += 7.8 );

//				ACTION_TriggerEvent( 'Scene_Intro_Doyle_Talk' );
//				ACTION_PlayLipSyncSound( 'LT_Intro_Doyle_Speak' , "D00_0600.DOYLE_B", 1.0, 1.0, 1.0 );
				ACTION_PlayLipSyncSoundDirect( AP_Doyle , "D00_0600.DOYLE_B", 1.0, 1.0, 1.0,, AP_Doyle.RootBone );
				ACTION_DisplaySubTitleMessage2( S_Localize( "DOYLE_B" ) , 2.5 , 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 2.50 /-----DOYLE_B="Doyle: I scouted up ahead... we're in a bit of a pickle here."

					WaitForAbsoluteTime( i += 3.3 );

//				ACTION_PlayLipSyncSound( 'LT_Intro_Doyle_Speak' , "D00_0600.DOYLE_C", 1.0, 1.0, 1.0 );
				ACTION_PlayLipSyncSoundDirect( AP_Doyle , "D00_0600.DOYLE_C", 0.0, 1.0, 1.0,, AP_Doyle.RootBone );
				ACTION_DisplaySubTitleMessage2( S_Localize( "DOYLE_C" ) , 7.5 , 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 7.51 /-----DOYLE_C="Doyle: The good news is I managed to find a few of my boys from 82nd. Still trying to round them up to make the big push towards St. Saveur. This isn't even our sector."

					WaitForAbsoluteTime( i += 7.7 );

				ACTION_SetLookAtTargetDirect( AP_Paddock , LT_Intro_04 , TRUE );
				AP_Paddock.bDoHeadTurn = TRUE ;
				ACTION_PlayLipSyncSoundDirect( AP_Paddock , "D00_0600.PADDOCK_AA", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "PADDOCK_A" ) , 2.9 , 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 2.93 /-----PADDOCK_A="Paddock: Yeah your sector is off finding some castle on the road to Cherbourg."

					WaitForAbsoluteTime( i += 0.2 );
				ACTION_SetLookAtTargetDirect( AP_Doyle , AP_Paddock , TRUE );
				AP_Doyle.bDoHeadTurn = TRUE ;
					WaitForAbsoluteTime( i += 0.5 );
				ACTION_SetLookAtTargetDirect( AP_Paddock , LT_Intro_05 , TRUE );
					WaitForAbsoluteTime( i += 2.3 );
				ACTION_ClearLookAtTargetDirect( AP_Doyle );
				ACTION_ClearLookAtTargetDirect( AP_Paddock );
					WaitForAbsoluteTime( i += 1.1 );

		//========== START DIALOGUE
				ACTION_SetLookAtTargetDirect( AP_Doyle , LT_Intro_03 , TRUE );
				AP_Doyle.bDoHeadTurn = TRUE ;
//				ACTION_PlayLipSyncSound( 'LT_Intro_Doyle_Speak' , "D00_0600.DOYLE_D", 1.0, 1.0, 1.0 );
				ACTION_PlayLipSyncSoundDirect( AP_Doyle , "D00_0600.DOYLE_D", 0.0, 1.0, 1.0,, AP_Doyle.RootBone );
				ACTION_DisplaySubTitleMessage2( S_Localize( "DOYLE_D" ) , 8.1 , 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 8.17 /-----DOYLE_D="Doyle: Well. There's the bad news.  They're banged up pretty bad.  Without any medical supplies...    It's not looking good."

					WaitForAbsoluteTime( i += 1.4 );
				ACTION_SetLookAtTargetDirect( AP_Doyle , LT_Intro_01 , TRUE );
					WaitForAbsoluteTime( i += 2.1 );
				ACTION_SetLookAtTargetDirect( AP_Doyle , LT_Intro_08 , TRUE );
					WaitForAbsoluteTime( i += 3.2 );

			//===== Cassidy gets up
				ACTION_TriggerEvent( 'TS_D00_0600_Intro_Cassidy' );

		//========== END ANIMRIDE
				ACTION_WaitForEvent( 'Event_Intro_Hartsock_Transfer' );


				ACTION_PlayerToCameraPawn( 'AP_Hartsock_Intro' );
				ACTION_CameraInPawnHead( 'AP_Hartsock_Intro' , 'Scene_D00_0600_Ride_Dummy' , FALSE );
				ACTION_StopScene( 'Scene_D00_0600_Ride_Dummy' , '' );

				ACTION_HideHUD( getLocalPlayerController() , FALSE );
				GetLocalPlayerPawn().bHidden = FALSE ;
				ACTION_DestroyActor( 'AP_Hartsock_Intro' );

					i = 0.0;

					ResetAbsoluteTime();
					StartAbsoluteTime();

					WaitForAbsoluteTime( i );

				ACTION_SetLookAtTargetDirect( AP_Cassidy , LT_Intro_02 , TRUE );
				AP_Cassidy.bDoHeadTurn = TRUE ;
				ACTION_PlayLipSyncSoundDirect( AP_Cassidy , "D00_0600.CASSIDY_A", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "CASSIDY_A" ) , 6.4 , 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 6.43 /-----CASSIDY_A="Cassidy: Corporal.  Sergeant Bixby from 2nd squad was killed this morning in the drop.  Private-"

					WaitForAbsoluteTime( i += 0.2 );
				ACTION_SetLookAtTargetDirect( AP_Doyle , AP_Cassidy , TRUE );
					WaitForAbsoluteTime( i += 1.9 );
				ACTION_SetLookAtTargetDirect( AP_Doyle , AP_Friar , TRUE );
					WaitForAbsoluteTime( i += 4.4 );
				ACTION_SetLookAtTargetDirect( AP_Cassidy , LT_Intro_01 , TRUE );
				AP_Cassidy.bDoHeadTurn = TRUE ;
					WaitForAbsoluteTime( i += 0.2 );

				ACTION_SetLookAtTargetDirect( AP_Friar , AP_Cassidy , TRUE );
				AP_Friar.bDoHeadTurn = TRUE ;
				ACTION_TriggerEvent( 'TS_D00_0600_Intro_Friar' );
				ACTION_PlayLipSyncSoundDirect( AP_Friar , "D00_0600.FRIAR_A", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "Friar_A" ) , 1.8 , 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 1.83 /-----FRIAR_A="Friar: Friar."

					WaitForAbsoluteTime( i += 0.3 );
				ACTION_SetLookAtTargetDirect( AP_Doyle , LT_Intro_Center , TRUE );
					WaitForAbsoluteTime( i += 0.7 );
				ACTION_SetLookAtTargetDirect( AP_Friar , LT_Intro_02 , TRUE );
					WaitForAbsoluteTime( i += 0.5 );
				ACTION_SetLookAtTargetDirect( AP_Cassidy , LT_Intro_01 , TRUE );
				AP_Cassidy.bDoHeadTurn = TRUE ;
					WaitForAbsoluteTime( i += 0.6 );

				ACTION_SetLookAtTargetDirect( AP_Cassidy , LT_Intro_02 , TRUE );
				ACTION_TriggerEvent( 'Event_SS_Intro_Friar_Finish' );
				ACTION_PlayLipSyncSoundDirect( AP_Cassidy , "D00_0600.CASSIDY_B", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "CASSIDY_B" ) , 11.2 , 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 11.25 /-----CASSIDY_B="Cassidy: Friar here was with him.  I was told the Krauts have a make shift Kraut aid station in the church in St. Martin. Bring all the bandages and plasma you can find. We need it now Corporal, these men can't wait."

					WaitForAbsoluteTime( i += 0.3 );
				ACTION_ClearLookAtTargetDirect( AP_Friar );
					WaitForAbsoluteTime( i += 0.7 );
				ACTION_SetLookAtTargetDirect( AP_Doyle , LT_Intro_01 , TRUE );
					WaitForAbsoluteTime( i += 1.1 );
				ACTION_TriggerEvent( 'TS_D00_0600_Intro_Friar' );
					WaitForAbsoluteTime( i += 1.7 );
				ACTION_SetLookAtTargetDirect( AP_Cassidy , LT_Intro_03 , TRUE );
				AP_Cassidy.bDoHeadTurn = TRUE ;
					WaitForAbsoluteTime( i += 2.3 );
				ACTION_SetLookAtTargetDirect( AP_Cassidy , LT_Intro_02 , TRUE );
				AP_Cassidy.bDoHeadTurn = TRUE ;
					WaitForAbsoluteTime( i += 1.8 );
				ACTION_SetLookAtTargetDirect( AP_Doyle , LT_Intro_03 , TRUE );
					WaitForAbsoluteTime( i += 2.6 );
				ACTION_SetLookAtTargetDirect( AP_Doyle , LT_Intro_01 , TRUE );
					WaitForAbsoluteTime( i += 1.1 );

				ACTION_TriggerEvent( 'TS_D00_0600_Intro_Doyle' );
				AP_Doyle.bDoHeadTurn = FALSE ;
				ACTION_SetLookAtTargetDirect( AP_Doyle , GetLocalPlayerPawn() , TRUE );				
				ACTION_PlayLipSyncSoundDirect( AP_Doyle , "D00_0600.DOYLE_E", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "DOYLE_E" ) , 3.0 , 1 , 1 , 1 , TRUE , TRUE );
						//-----/ 3.35 /-----DOYLE_E="Doyle: Hartsock.   Save my friends."
					WaitForAbsoluteTime( i += 1.4 );
				ACTION_ClearLookAtTargetDirect( AP_Cassidy );
					WaitForAbsoluteTime( i += 2.4 );
				ACTION_ClearLookAtTargetDirect( AP_Doyle );
				AP_Paddock.bDontFrustumCull = FALSE ;
				ACTION_TriggerEvent( 'Event_SS_Intro_Paddock_Dismount' );

					StopAbsoluteTime();

					sleep( 1.5 );

			//===== Unlock player , save , objective
				ACTION_TriggerEvent( 'TriggeredScriptIntro' );
				GetLocalPlayerPawn().bHidden = FALSE ;
				ACTION_SetUnitHiddenOnCompass( 'Unit_US_Ass' , FALSE );

			//===== Start combat 1
				//ACTION_TriggerEvent( 'TSCombat_C1_A' );
				ACTION_TriggerEvent( 'TS_D00_0600_Coffee' );

			//===== Waypoint beacon
				ACTION_TriggerEvent( 'GBXWPB_PreChurch01' );
				gbxWaypointBeacon( GetFirstActor( 'GBXWPB_PreChurch01' ) ).bEnabled = true;

				ACTION_TriggerEvent( 'GBXWPB_Church' );

		ScriptEnd:
	}

