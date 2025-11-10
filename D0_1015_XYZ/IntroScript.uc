//=============================================================================
// IntroScript.
//=============================================================================
class IntroScript extends TriggeredScript
        placeable;

var int Monologue, MonologueMusic;
var Actor MyPlayer;
var pawn Mac;
var pawn Legget;
var pawn Allen;
var pawn Garnett;
var pawn Hartsock;
var pawn Leggett;
var pawn LeggettScript;
var actor GarnettIntroScript;

//=============================================================================
// ADDITIONAL VARIABLES LISTED HERE
//=============================================================================
//GoodLuck XYZ - CShedd

state Triggered
	{
		Begin:

		ACTION_SaveMemoryReport("XYZ_Start");

				GarnettIntroScript = GetFirstActor( 'GarnettIntroScript' );
				GetFirstActor( 'LeggettIntroScript' ).goToState( 'TriggeredIdle' );

				ACTION_TriggerEvent( 'SpawnIntroCharacters' );

			//===== Lock player movement
				ACTION_HideHUD ( GetLocalPlayerController() , true);
				ACTION_LimitPlayerInput( GetLocalPlayerController(), true ); 
				ACTION_BlockActionKeys( KEY_ACTION_CROUCH + KEY_ACTION_USE + KEY_ACTION_LOOK ); 

        		ACTION_LockPlayerMovement( GetLocalPlayerPawn() );
        		ACTION_SaveMemoryReport( "XYZ_Start" );

			//===== Map name, date, time
        		ACTION_MapIntroTextPos( GetLocalPlayerController(), 50, 350 );
       			ACTION_MapIntroText( GetLocalPlayerController(), 1, 2.0 );

		//StartAbsoluteTime();
		//ResetAbsoluteTime();

		//===== Monologue

		MyPlayer = GetFirstActor( 'Player' );
		MonologueMusic = MyPlayer.PlayMusic( "Music.D01015_VO", 0.0, FALSE );
			sleep( 4.6 );
		Monologue = MyPlayer.PlayMusic( "D01015.VOICEOVER_A", 0.0, FALSE );
			sleep( 3.0 );

		StartAbsoluteTime();
		ResetAbsoluteTime();

					//WaitForAbsoluteTime( 4.5 );
				ACTION_DisplaySubTitleMessage2(S_Localize("BAKER_A", "D0_1015_XYZ" ), 3.0 , 5 , 1 , 1 , , TRUE );
						//	"Baker: I never asked to be squad leader.
					WaitForAbsoluteTime( 5.0 );

		StopAbsoluteTime();

		AfterPlayerBreak:

				Leggett = GetPawn( 'Leggett01' );
				ACTION_AttachStaticMesh( Leggett , StaticMesh's_military_us.equipment.us_radio_field_pack', 'radio_bone' );

        	//====== Stop Monologue
			MyPlayer.StopMusic( Monologue, 1.5 );  // stop sound by fading out over 1.5 seconds;
			MyPlayer.StopMusic( MonologueMusic, 1.5 );  // stop sound by fading out over 1.5 seconds;

        	//===== Fade out text and fade into game
				GarnettIntroScript.goToState( 'Background' );
				GetFirstActor( 'LeggettIntroScript' ).goToState( 'ListenOne' );

				ACTION_MapIntroText( GetLocalPlayerController(), 2, 2.0 );
                	sleep( 2.0 );
        		ACTION_FadeOverlay( GetLocalPlayerController(), 2, 6.0 );
				//ACTION_PlaySoundReturnHandle( 'Player', "D01015_SOUNDS.AMB_WIND_BIRDS_BUGS", 1.0, 1.0, 10000); 
					sleep( 1.0 );

				ACTION_UnblockActionKeys( -1 );
					sleep (2.0);
				//ACTION_TriggerEvent( 'AmbientSound' );
				ACTION_ClearForcedFaceActor();

//=============================================================================
// ADDITIONAL INTRO SCRIPTING HERE
//=============================================================================

				ACTION_TriggerEvent( 'USATeamHide' );
				ACTION_DisableBattleDialogue();

				ACTION_SetLookAtTarget( 'Mac', GetFirstActor( 'LookTarget4'), true );
				ACTION_SetLookAtTarget( 'Allen', GetFirstActor( 'LookTarget4'), true );
				ACTION_SetLookAtTarget( 'Hartsock', GetFirstActor( 'LookTarget5'), true );

				ACTION_DisplaySubTitleMessage2(S_Localize("LEGGETT_A", "D0_1015_XYZ" ),4 , 1 , 1 , 1 , , TRUE );
					sleep( ACTION_PlayLipSyncSound( 'Leggett01', "D01015.LEGGETT_A", 1.0, 1.0, 80.0 ) + 0.5 );
				ACTION_SetLookAtTarget( 'Leggett01', GetFirstActor('LookTarget1'), true );
				GetFirstActor( 'LeggettIntroScript' ).goToState( 'ListenOne' );
					sleep(2.0);

				ACTION_SetLookAtTarget( 'Hartsock', GetFirstActor( 'LookTarget2'), true );
				ACTION_DisplaySubTitleMessage2(S_Localize("HARTSOCK_A", "D0_1015_XYZ" ),4 , 1 , 1 , 1 , , TRUE );
					sleep( ACTION_PlayLipSyncSound( 'Hartsock', "D01015.HARTSOCK_A", 1.0, 1.0, 80.0 ) + 0.5 );

				ACTION_DisplaySubTitleMessage2(S_Localize("HARTSOCK_B", "D0_1015_XYZ" ),4 , 1 , 1 , 1 , , TRUE );
					sleep( ACTION_PlayLipSyncSound( 'Hartsock', "D01015.HARTSOCK_B", 1.0, 1.0, 80.0 ) + 0.5 );
				ACTION_SetLookAtTarget( 'Hartsock', none, true );

				//sleep( ACTION_PlayLipSyncSound( 'Leggett01', "D01015.LEGGETT_A", 1.0, 1.0, 80.0 ) - 2.5 );

				//ACTION_TriggerEvent( 'GarnettAtCow' );
				GetFirstActor('GarnettIntroScript').goToState( 'GarnettAtCow' );
				ACTION_SetLookAtTarget( 'Hartsock', GetFirstActor( 'LookTarget6'), true );
				ACTION_DisplaySubTitleMessage2(S_Localize("HARTSOCK_C", "D0_1015_XYZ" ),4 , 1 , 1 , 1 , , TRUE );
				sleep( ACTION_PlayLipSyncSound( 'Hartsock', "D01015.HARTSOCK_C", 1.0, 1.0, 80.0 ) + 0.5 );

				ACTION_SetLookAtTarget( 'Hartsock', GetFirstActor( 'LookTarget1'), true );
				ACTION_DisplaySubTitleMessage2(S_Localize("HARTSOCK_D", "D0_1015_XYZ" ),4 , 1 , 1 , 1 , , TRUE );
					sleep( ACTION_PlayLipSyncSound( 'Hartsock', "D01015.HARTSOCK_D", 1.0, 1.0, 80.0 ) + 0.5 );

				ACTION_WaitForEvent( 'GarnettOut' );

				ACTION_SetLookAtTarget( 'Hartsock', GetFirstActor( 'LookTarget2'), true );
				ACTION_DisplaySubTitleMessage2(S_Localize("HARTSOCK_E", "D0_1015_XYZ" ),4 , 1 , 1 , 1 , , TRUE );
					sleep( ACTION_PlayLipSyncSound( 'Hartsock', "D01015.HARTSOCK_E", 1.0, 1.0, 80.0 ) + 0.5 );

				ACTION_SetLookAtTarget( 'Mac', GetFirstActor( 'LookTarget5'), true );
				ACTION_SetLookAtTarget( 'Hartsock', GetFirstActor( 'LookTarget5'), true );
				ACTION_SetLookAtTarget( 'Leggett01', GetFirstActor('LookTarget1' ), true );
				ACTION_SetLookAtTarget( 'Allen', GetFirstActor( 'LookTarget5'), true );


				GetFirstActor( 'LeggettIntroScript' ).goToState( 'TalkOne' );
				ACTION_DisplaySubTitleMessage2(S_Localize("LEGGETT_B", "D0_1015_XYZ" ),4 , 1 , 1 , 1 , , TRUE );
					sleep( ACTION_PlayLipSyncSound( 'Leggett01', "D01015.LEGGETT_B", 1.0, 1.0, 80.0 ) + 0.5 );
				ACTION_SetLookAtTarget( 'Leggett01', GetFirstActor('LookTarget1'), true );

				ACTION_DisplaySubTitleMessage2(S_Localize("LEGGETT_C", "D0_1015_XYZ" ),4 , 1 , 1 , 1 , , TRUE );
					sleep( ACTION_PlayLipSyncSound( 'Leggett01', "D01015.LEGGETT_C", 1.0, 1.0, 80.0 ) + 0.5 );
				ACTION_ClearLookAtTarget( 'Leggett01' );

//============
//MAC
//============

				ACTION_SetLookAtTarget( 'Mac', GetFirstActor( 'LookTarget2'), true );
				ACTION_SetLookAtTarget( 'Leggett01', GetFirstActor('LookTarget1' ), true );
				ACTION_SetLookAtTarget( 'Hartsock', GetFirstActor( 'LookTarget1'), true );
				ACTION_SetLookAtTarget( 'Allen', GetFirstActor( 'LookTarget1'), true );


				ACTION_DisplaySubTitleMessage2(S_Localize("MAC_A", "D0_1015_XYZ" ),4 , 1 , 1 , 1 , , TRUE );
					sleep( ACTION_PlayLipSyncSound( 'Mac', "D01015.MAC_A", 1.0, 1.0, 80.0 ) + 0.5 );
				ACTION_SetLookAtTarget( 'Mac', GetFirstActor('LookTarget4' ), true );

				ACTION_TriggerEvent( 'LeggettIntroScript' );

				ACTION_DisplaySubTitleMessage2(S_Localize("MAC_B", "D0_1015_XYZ" ),4 , 1 , 1 , 1 , , TRUE );
					sleep( ACTION_PlayLipSyncSound( 'Mac', "D01015.MAC_B", 1.0, 1.0, 80.0 ) + 0.5 );
				ACTION_SetLookAtTarget( 'Mac', GetFirstActor('LookTarget2' ), true );
				ACTION_SetLookAtTarget( 'Hartsock', GetFirstActor('LookTarget2' ), true );

				//GetFirstActor( 'LeggettIntroScript' ).goToState( 'ListenOne' );
				ACTION_DisplaySubTitleMessage2(S_Localize("MAC_C", "D0_1015_XYZ" ),4 , 1 , 1 , 1 , , TRUE );
					sleep( ACTION_PlayLipSyncSound( 'Mac', "D01015.MAC_C", 1.0, 1.0, 80.0 ) + 0.5 );
				ACTION_SetLookAtTarget( 'Leggett01', GetFirstActor('LookTarget3' ), true );
				ACTION_SetLookAtTarget( 'Mac', GetFirstActor('LookTarget5' ), true );

//============
//ALLEN
//============

				ACTION_SetLookAtTarget( 'Allen', GetFirstActor('LookTarget1' ), true );
				//ACTION_SetLookAtTarget( 'Garnett', GetFirstActor('LookTarget1' ), true );
				ACTION_SetLookAtTarget( 'Mac', GetFirstActor('LookTarget6' ), true );

				ACTION_DisplaySubTitleMessage2(S_Localize("ALLEN_A", "D0_1015_XYZ" ),4 , 1 , 1 , 1 , , TRUE );
					sleep( ACTION_PlayLipSyncSound( 'Allen', "D01015.ALLEN_A", 1.0, 1.0, 80.0 ) - 0.2 );
				ACTION_SetLookAtTarget( 'Hartsock', GetFirstActor('LookTarget6' ), true );
				//ACTION_SetLookAtTarget( 'Garnett', GetFirstActor('LookTarget6' ), true );

//============
//MAC
//============

				ACTION_SetLookAtTarget( 'Hartsock', GetFirstActor('LookTarget1' ), true );
				ACTION_SetLookAtTarget( 'Mac', GetFirstActor('LookTarget6' ), true );
				ACTION_SetLookAtTarget( 'Leggett01', GetFirstActor('LookTarget1' ), true );
				ACTION_SetLookAtTarget( 'Allen', GetFirstActor( 'LookTarget2'), true );
	

				ACTION_DisplaySubTitleMessage2(S_Localize("MAC_D", "D0_1015_XYZ" ),4 , 1 , 1 , 1 , , TRUE );
					sleep( ACTION_PlayLipSyncSound( 'Mac', "D01015.MAC_D", 1.0, 1.0, 80.0 ) + 0.5 );

//============
//ALLEN
//============

				ACTION_SetLookAtTarget( 'Hartsock', GetFirstActor('LookTarget6' ), true );
				ACTION_SetLookAtTarget( 'Leggett01', GetFirstActor('LookTarget6' ), true );
				//ACTION_SetLookAtTarget( 'Garnett', GetFirstActor('LookTarget6' ), true );
				ACTION_SetLookAtTarget( 'Allen', GetFirstActor('LookTarget1' ), true );

				ACTION_DisplaySubTitleMessage2(S_Localize("ALLEN_B", "D0_1015_XYZ" ),4 , 1 , 1 , 1 , , TRUE );
					sleep( ACTION_PlayLipSyncSound( 'Allen', "D01015.ALLEN_B", 1.0, 1.0, 80.0 ) + 0.5 );
				ACTION_SetLookAtTarget( 'Leggett01', GetFirstActor('LookTarget2' ), true );

				ACTION_DisplaySubTitleMessage2(S_Localize("ALLEN_C", "D0_1015_XYZ" ),4 , 1 , 1 , 1 , , TRUE );
					sleep( ACTION_PlayLipSyncSound( 'Allen', "D01015.ALLEN_C", 1.0, 1.0, 80.0 ) + 0.5 );

/*
stat anim name=infantryusa2 

look for channels and channel 0
*/

//============
//MAC
//============

				ACTION_ClearLookAtTarget( 'Garnett' );
				ACTION_SetLookAtTarget( 'Leggett01', GetFirstActor('LookTarget1' ), true );
				ACTION_SetLookAtTarget( 'Mac', GetFirstActor('LookTarget6' ), true );
				ACTION_SetLookAtTarget( 'Hartsock', GetFirstActor('LookTarget1' ), true );

				ACTION_DisplaySubTitleMessage2(S_Localize("MAC_E", "D0_1015_XYZ" ),4 , 1 , 1 , 1 , , TRUE );
					sleep( ACTION_PlayLipSyncSound( 'Mac', "D01015.MAC_E", 1.0, 1.0, 80.0 ) + 0.5 );
				ACTION_SetLookAtTarget( 'Mac', GetFirstActor('LookTarget2' ), true );
				ACTION_SetLookAtTarget( 'Garnett', GetFirstActor('LookTarget2' ), true );
				//GetFirstActor( 'LeggettIntroScript' ).goToState( 'Triggered' );

				ACTION_DisplaySubTitleMessage2(S_Localize("MAC_F", "D0_1015_XYZ" ),4 , 1 , 1 , 1 , , TRUE );
					sleep( ACTION_PlayLipSyncSound( 'Mac', "D01015.MAC_F", 1.0, 1.0, 80.0 ) + 0.5 );

				GetFirstActor( 'AllenIntroScript').goToState('Exit' );

				ACTION_DisplaySubTitleMessage2(S_Localize("MAC_G", "D0_1015_XYZ" ),4 , 1 , 1 , 1 , , TRUE );
					sleep( ACTION_PlayLipSyncSound( 'Mac', "D01015.MAC_G", 1.0, 1.0, 80.0 ) + 0.5 );

				ACTION_TriggerEvent( 'AllenIntroScript' );
				GetFirstActor( 'GarnettIntroScript' ).goToState( 'Triggered' );
				GetFirstActor( 'LeggettIntroScript' ).goToState( 'ExitIntro' );
				ACTION_TriggerEvent( 'MacIntroScript' );

				ACTION_DisplaySubTitleMessage2(S_Localize("MAC_H", "D0_1015_XYZ" ),4 , 1 , 1 , 1 , , TRUE );
					sleep( ACTION_PlayLipSyncSound( 'Mac', "D01015.MAC_H", 1.0, 1.0, 80.0 ) + 0.5 );

//============
//Dismount
//============


				//ACTION_TriggerEvent( 'LeggettIntroScript' );
				ACTION_OrderMove( 'USAFireTeam', 'USAFireTeam_Path01' );

				ACTION_SetObjectiveStatus( 0, OI_Active, 'ObjectiveList' );
					sleep(1.0);
				ACTION_OrderMove( 'USAFireTeam', 'USAFireTeam_Path01' );
				ACTION_OrderMove( 'USAFireTeamb', 'USAFireTeamb_Path01' );
				ACTION_OrderMove( 'USAFireTeam1', 'USAFireTeam1_Path01' );
	
				//ACTION_MoveTowardTag( 'Leggett01', 'USAFireTeam1_Path01');
				//ACTION_MoveTowardTag( 'Mac', 'USAFireTeam1_Path01');
					sleep (2.0);
				ACTION_TriggerEvent( 'USATeamHide' );
				ACTION_TriggerEvent( 'SpawnGermanGunner01' );

					sleep(2.0);
				ACTION_CheckPointSave( 1 );

					sleep(3.0 );
				ACTION_HideHUD ( GetLocalPlayerController() , false);
				ACTION_LimitPlayerInput( GetLocalPlayerController(), false ); 
				ACTION_UnBlockActionKeys( KEY_ACTION_CROUCH + KEY_ACTION_USE + KEY_ACTION_LOOK );

	    		ACTION_UnlockPlayerMovement( GetLocalPlayerPawn() );

				ACTION_SetObjectiveStatus( 0, OI_Active, 'ObjectiveList' );
					sleep( 2.0 );

				ACTION_TriggerEvent( 'HartsockIntroScript' );
				ACTION_OrderMove( 'USAFireTeam1', 'USAFireTeam1_Path01' );
				ACTION_BlockNavPoints('BlockMacEndSpawn' );

//============
//HARTSOCK
//============

				ACTION_EnableBattleDialogue();

//=============================================================================
// START MAP
//=============================================================================

	}

state PlayerBreak
	{
		Begin:

			ACTION_DisablePlayerBreak();
        	GotoState( 'Triggered', 'AfterPlayerBreak' );
	}
