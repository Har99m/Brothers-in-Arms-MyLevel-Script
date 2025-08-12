//=============================================================================
// TS_D00_1630_IntroScene.
//=============================================================================
class TS_D00_1630_IntroScene extends TriggeredScript
	placeable;

var float i;
//  Looktarget ordering starts at the player at 12 o'clock and goes clockwise
var Actor LT_Intro_01 , LT_Intro_02 , LT_Intro_03 , LT_Intro_04 , LT_Intro_05 , LT_Intro_06 , LT_Intro_07 , LT_Intro_Center ;
var AnimPawn AP_Hartsock , AP_Garnett , AP_Allen , AP_Doyle , AP_Paddock , AP_Friar , AP_Baker , AP_Paige , AP_McConnel , AP_Campbell , AP_Corrion , AP_Desola , AP_Headride_Hartsock ;
var WargamePawn Player;
var TS_D00_1630_Training_Toggle REF_Toggle ;

state Triggered
	{
		Begin:

				ACTION_TriggerEvent( 'CSU_IntroCharacters' );

			//===== Define Characters as AnimPawn Actors

				AP_Hartsock = AnimPawn( GetPawn( 'Hartsock' ));
				AP_Allen = AnimPawn( GetPawn( 'Allen' ));
				AP_Garnett = AnimPawn( GetPawn( 'Garnett' ));
				AP_Doyle = AnimPawn( GetPawn( 'Doyle' ));
				AP_Paddock = AnimPawn( GetPawn( 'Paddock' ));
				AP_Friar = AnimPawn( GetPawn( 'Friar' ));
				AP_Baker = AnimPawn( GetPawn( 'Baker' ));
				AP_Paige = AnimPawn( GetPawn( 'Paige' ));
				AP_McConnel = AnimPawn( GetPawn( 'McConnel' ));
				AP_Campbell = AnimPawn( GetPawn( 'Campbell' ));
				AP_Corrion = AnimPawn( GetPawn( 'Corrion' ));
				AP_Desola = AnimPawn( GetPawn( 'Desola' ));

				REF_Toggle = TS_D00_1630_Training_Toggle( GetFirstActor( 'TS_D00_1630_Training_Toggle' ));

				AP_Headride_Hartsock = AnimPawn( GetPawn( 'AP_Headride_Hartsock' ));

				LT_Intro_01 = GetFirstActor( 'LT_Intro_01' );
				LT_Intro_02 = GetFirstActor( 'LT_Intro_02' );
				LT_Intro_03 = GetFirstActor( 'LT_Intro_03' );
				LT_Intro_04 = GetFirstActor( 'LT_Intro_04' );
				LT_Intro_05 = GetFirstActor( 'LT_Intro_05' );
				LT_Intro_06 = GetFirstActor( 'LT_Intro_06' );
				LT_Intro_07 = GetFirstActor( 'LT_Intro_07' );
				LT_Intro_Center = GetFirstActor( 'LT_Intro_Center' );

				GetFirstActor( 'SM_Intro_Baker_M1' ).bHidden = FALSE ;

			//===== Define Character AnimSets

    			ACTION_SetAnimSetDirect( AP_Hartsock , "a_cin_d00_Three_patrol_action.a_cin_d00_Three_patrol_action" );
    			ACTION_SetAnimSetDirect( AP_Garnett , "a_cin_d00_Three_patrol_action.a_cin_d00_Three_patrol_action" );
    			ACTION_SetAnimSetDirect( AP_Allen , "a_cin_d00_Three_patrol_action.a_cin_d00_Three_patrol_action" );
    			ACTION_SetAnimSetDirect( AP_Doyle , "a_cin_d00_Three_patrol_action.a_cin_d00_Three_patrol_action" );
    			ACTION_SetAnimSetDirect( AP_Paddock , "a_cin_d00_Three_patrol_action.a_cin_d00_Three_patrol_action" );
    			ACTION_SetAnimSetDirect( AP_Friar , "a_cin_d00_Three_patrol_action.a_cin_d00_Three_patrol_action" );
    			ACTION_SetAnimSetDirect( AP_Baker , "a_cin_d00_Three_patrol_action.a_cin_d00_Three_patrol_action" );
    			ACTION_SetAnimSetDirect( AP_Paige , "a_cin_d00_Three_patrol_action.a_cin_d00_Three_patrol_action" );
    			ACTION_SetAnimSetDirect( AP_McConnel , "a_cin_d00_Three_patrol_action.a_cin_d00_Three_patrol_action" );
    			ACTION_SetAnimSetDirect( AP_Campbell , "a_cin_d00_Three_patrol_action.a_cin_d00_Three_patrol_action" );
    			ACTION_SetAnimSetDirect( AP_Corrion , "a_cin_d00_Three_patrol_action.a_cin_d00_Three_patrol_action" );
    			ACTION_SetAnimSetDirect( AP_Desola , "a_cin_d00_Three_patrol_action.a_cin_d00_Three_patrol_action" );

				ACTION_ClearPawnIdleQueue( 'Allen' );
				ACTION_AddAnimToPawnIdleQueue( 'Allen', 'crouched_idle_b_1' );
				ACTION_AddAnimToPawnIdleQueue( 'Allen', 'crouched_idle_b_1' );
				ACTION_AddAnimToPawnIdleQueue( 'Allen', 'crouched_idle_b_2' );
				ACTION_AddAnimToPawnIdleQueue( 'Allen', 'crouched_idle_b_1' );
				ACTION_PlayAnimFromPawnIdleQueue( 'Allen', FALSE );

				ACTION_ClearPawnIdleQueue( 'Garnett' );
				ACTION_AddAnimToPawnIdleQueue( 'Garnett', 'crouched_idle_a_3' );
				ACTION_AddAnimToPawnIdleQueue( 'Garnett', 'crouched_idle_a_1' );
				ACTION_AddAnimToPawnIdleQueue( 'Garnett', 'crouched_idle_a_1' );
				ACTION_AddAnimToPawnIdleQueue( 'Garnett', 'crouched_idle_a_1' );
				ACTION_PlayAnimFromPawnIdleQueue( 'Garnett', FALSE );

				GbxPawn( GetPawn( 'Baker' )).SetWeapon( None );
				ACTION_TriggerEvent( 'Event_SS_Intro_Baker_Setup' );

				ACTION_ClearPawnIdleQueue( 'Doyle' );
				ACTION_AddAnimToPawnIdleQueue( 'Doyle', 'crouched_idle_a_1' );
				ACTION_AddAnimToPawnIdleQueue( 'Doyle', 'crouched_idle_a_1' );
				ACTION_AddAnimToPawnIdleQueue( 'Doyle', 'crouched_idle_a_3' );
				ACTION_AddAnimToPawnIdleQueue( 'Doyle', 'crouched_idle_a_1' );
				ACTION_AddAnimToPawnIdleQueue( 'Doyle', 'crouched_idle_a_1' );
				ACTION_PlayAnimFromPawnIdleQueue( 'Doyle', FALSE );

				ACTION_ClearPawnIdleQueue( 'Paddock' );
				ACTION_AddAnimToPawnIdleQueue( 'Paddock', 'crouched_idle_c_1' );
				ACTION_AddAnimToPawnIdleQueue( 'Paddock', 'crouched_idle_c_2' );
				ACTION_AddAnimToPawnIdleQueue( 'Paddock', 'crouched_idle_c_1' );
				ACTION_PlayAnimFromPawnIdleQueue( 'Paddock', FALSE );

				ACTION_ClearPawnIdleQueue( 'Friar' );
				ACTION_AddAnimToPawnIdleQueue( 'Friar', 'crouched_idle_c_1' );
				ACTION_AddAnimToPawnIdleQueue( 'Friar', 'crouched_idle_c_2' );
				ACTION_PlayAnimFromPawnIdleQueue( 'Friar', FALSE );

				ACTION_ClearPawnIdleQueue( 'Paige' );
				ACTION_AddAnimToPawnIdleQueue( 'Paige', 'crouched_idle_c_1' );
				ACTION_AddAnimToPawnIdleQueue( 'Paige', 'crouched_idle_c_2' );
				ACTION_AddAnimToPawnIdleQueue( 'Paige', 'crouched_idle_c_1' );
				ACTION_PlayAnimFromPawnIdleQueue( 'Paige', FALSE );

				ACTION_ClearPawnIdleQueue( 'McConnel' );
				ACTION_AddAnimToPawnIdleQueue( 'McConnel', 'crouched_idle_a_1' );
				ACTION_AddAnimToPawnIdleQueue( 'McConnel', 'crouched_idle_a_1' );
				ACTION_AddAnimToPawnIdleQueue( 'McConnel', 'crouched_idle_a_3' );
				ACTION_AddAnimToPawnIdleQueue( 'McConnel', 'crouched_idle_a_1' );
					ACTION_PlayAnimFromPawnIdleQueue( 'McConnel', FALSE );

				ACTION_ClearPawnIdleQueue( 'Campbell' );
				ACTION_AddAnimToPawnIdleQueue( 'Campbell', 'crouched_idle_a_1' );
				ACTION_AddAnimToPawnIdleQueue( 'Campbell', 'crouched_idle_a_1' );
				ACTION_AddAnimToPawnIdleQueue( 'Campbell', 'crouched_idle_a_1' );
				ACTION_AddAnimToPawnIdleQueue( 'Campbell', 'crouched_idle_a_3' );
				ACTION_PlayAnimFromPawnIdleQueue( 'Campbell', FALSE );

				ACTION_ClearPawnIdleQueue( 'Corrion' );
				ACTION_AddAnimToPawnIdleQueue( 'Corrion', 'crouched_idle_b_1' );
				ACTION_AddAnimToPawnIdleQueue( 'Corrion', 'crouched_idle_b_2' );
				ACTION_AddAnimToPawnIdleQueue( 'Corrion', 'crouched_idle_b_1' );
				ACTION_PlayAnimFromPawnIdleQueue( 'Corrion', FALSE );

				ACTION_ClearPawnIdleQueue( 'Desola' );
				ACTION_AddAnimToPawnIdleQueue( 'Desola', 'crouched_idle_c_2' );
				ACTION_AddAnimToPawnIdleQueue( 'Desola', 'crouched_idle_c_1' );
				ACTION_PlayAnimFromPawnIdleQueue( 'Desola', FALSE );

				ACTION_DisableTalkToMessageForCharacter( 'Allen' );
				ACTION_DisableTalkToMessageForCharacter( 'Doyle' );
				ACTION_DisableTalkToMessageForCharacter( 'Garnett' );
				ACTION_DisableTalkToMessageForCharacter( 'Friar' );
				ACTION_DisableTalkToMessageForCharacter( 'Paddock' );

				ACTION_DisableBattleDialogueForCharacter( 'Allen' );
				ACTION_DisableBattleDialogueForCharacter( 'Doyle' );
				ACTION_DisableBattleDialogueForCharacter( 'Garnett' );
				ACTION_DisableBattleDialogueForCharacter( 'Friar' );
				ACTION_DisableBattleDialogueForCharacter( 'Paddock' );

		//========= Force the player to crouch
				GetLocalPlayerPawn().StartGoingToCrouch( TRUE );
				ACTION_BlockActionKeys( KEY_ACTION_CROUCH  );

			//===== Set up initial LookAtTargets
				ACTION_SetLookAtTargetDirect( AP_Allen , LT_Intro_01 , TRUE );	
				ACTION_SetLookAtTargetDirect( AP_Corrion , LT_Intro_07 , TRUE );	
				ACTION_SetLookAtTargetDirect( AP_Garnett , LT_Intro_Center , TRUE );	

				ACTION_PawnSetHeadTurnMult( 'Allen' , 0.6 );
				ACTION_PawnSetHeadTurnMult( 'Baker' , 0.8 );
				ACTION_PawnSetHeadTurnMult( 'Corrion' , 0.6 );
				ACTION_PawnSetHeadTurnMult( 'Garnett' , 0.7 );

			//===== Trigger convoy
//				ACTION_TriggerEvent( 'TS_D00_1630_IntroHalfTrack' );
//				ACTION_TriggerEvent( 'TS_D00_1630_IntroOpel' );
				ACTION_TriggerEvent( 'BTV_Corrion' );

			//===== Initiate

					i = 0.0;

					ResetAbsoluteTime();
					StartAbsoluteTime();

					WaitForAbsoluteTime( i );
					WaitForAbsoluteTime( i += 47.2 );
				ACTION_LimitPlayerInput( GetLocalPlayerController() , TRUE );

//=============================================================================

			//===== Initiate

					i = 0.0;

					ResetAbsoluteTime();
					StartAbsoluteTime();

					WaitForAbsoluteTime( i );
					WaitForAbsoluteTime( i += 3.0 );

		//========== BAKER LOOKS OVER HIS SHOULDER
				AP_Baker.bDoHeadTurn = FALSE ;
				ACTION_TriggerEvent( 'Event_SS_Intro_Baker_Those_Halftracks' );

					WaitForAbsoluteTime( i += 2.0 );

				ACTION_SetLookAtTargetDirect( AP_Corrion , LT_Intro_06 , TRUE );	

					WaitForAbsoluteTime( i += 2.5 );

		//========== START DIALOGUE

				ACTION_PlayLipSyncSoundDirect( AP_Baker , "D00_1630.BAKER_A", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "BAKER_A" ) , 2.1 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 2.15 / -----BAKER_A="Baker: Those halftracks were pulling 88's into town."

					WaitForAbsoluteTime( i += 0.2 );
				ACTION_SetLookAtTargetDirect( AP_Allen , LT_Intro_07 , TRUE );	
					WaitForAbsoluteTime( i += 0.4 );
				ACTION_SetLookAtTargetDirect( AP_Garnett , AP_Baker , TRUE );	
					WaitForAbsoluteTime( i += 0.8 );
				ACTION_SetLookAtTargetDirect( AP_Corrion , LT_Intro_07 , TRUE );	
					WaitForAbsoluteTime( i += 1.2 );

				ACTION_TriggerEvent( 'Event_SS_Intro_Baker_We_Dont' );
				ACTION_PlayLipSyncSoundDirect( AP_Baker , "D00_1630.BAKER_B", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "BAKER_B1" ) , 3.5 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 3.50 / -----BAKER_B1="Baker: We don't actually know where they're going.  So we have to split up and punch them between us."
					WaitForAbsoluteTime( i += 1.8 );
				ACTION_SetLookAtTargetDirect( AP_Garnett , LT_Intro_01 , TRUE );	
					WaitForAbsoluteTime( i += 0.8 );
				ACTION_SetLookAtTargetDirect( AP_Corrion , LT_Intro_06 , TRUE );	
					WaitForAbsoluteTime( i += 0.8 );
				ACTION_SetLookAtTargetDirect( AP_Allen , AP_Garnett , TRUE );	
					WaitForAbsoluteTime( i += 0.5 );	
				ACTION_DisplaySubTitleMessage2( S_Localize( "BAKER_B2" ) , 3.7 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 3.75 / -----BAKER_B2="Baker: Red, you have to lead a patrol.  Corrion and Desola, you're with me."

					WaitForAbsoluteTime( i += 2.0 );
				ACTION_SetLookAtTargetDirect( AP_Allen , LT_Intro_07 , TRUE );
					WaitForAbsoluteTime( i += 0.7 );
				ACTION_SetLookAtTargetDirect( AP_Corrion , AP_Baker , TRUE );
					WaitForAbsoluteTime( i += 0.3 );
				ACTION_SetLookAtTargetDirect( AP_Desola , AP_Baker , TRUE );
					WaitForAbsoluteTime( i += 1.1 );

				ACTION_SetLookAtTargetDirect( AP_Corrion , LT_Intro_01 , TRUE );	
				ACTION_PlayLipSyncSoundDirect( AP_Corrion , "D00_1630.CORRION_A", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "CORRION_A" ) , 1.0 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 0.68 / -----CORRION_A="Corrion: Great."

					WaitForAbsoluteTime( i += 0.3 );
				ACTION_SetLookAtTargetDirect( AP_Allen , AP_Corrion , TRUE );	
					WaitForAbsoluteTime( i += 1.5 );
				ACTION_SetLookAtTargetDirect( AP_Garnett , AP_Corrion , TRUE );	
				ACTION_ClearLookAtTargetDirect( AP_Desola );
	
				ACTION_TriggerEvent( 'Event_SS_Intro_Baker_Not_Now' );
				ACTION_PlayLipSyncSoundDirect( AP_Baker , "D00_1630.BAKER_C", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "BAKER_C" ) , 1.2 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 1.17 / -----BAKER_C="Baker: Not now Sam."

					WaitForAbsoluteTime( i += 1.6 );

				ACTION_SetLookAtTargetDirect( AP_Allen , AP_Corrion , TRUE );	
				ACTION_PlayAnimWithQueueDirect( AP_Allen , 'crouched_idle_b_1' , 0.5 , 1.0 );
				ACTION_PlayLipSyncSoundDirect( AP_Allen , "D00_1630.ALLEN_A", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "ALLEN_A" ) , 1.5 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 1.71 / -----ALLEN_A="Allen: Yeah not now Sam."

					WaitForAbsoluteTime( i += 1.1 );
				ACTION_SetLookAtTargetDirect( AP_Garnett , LT_Intro_05 , TRUE );	
					WaitForAbsoluteTime( i += 0.4 );
				ACTION_SetLookAtTargetDirect( AP_Corrion , LT_Intro_06 , TRUE );	

				ACTION_TriggerEvent( 'Event_SS_Intro_Baker_And_You' );
				ACTION_PlayLipSyncSoundDirect( AP_Baker , "D00_1630.BAKER_D", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "BAKER_D" ) , 1.6 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 1.64 / -----BAKER_D="Baker: -and you get to babysit these two."

					WaitForAbsoluteTime( i += 0.4 );
				ACTION_SetLookAtTargetDirect( AP_Allen , LT_Intro_06 , TRUE );
					WaitForAbsoluteTime( i += 1.2 );
				ACTION_SetLookAtTargetDirect( AP_Garnett , LT_Intro_07 , TRUE );	
					WaitForAbsoluteTime( i += 0.6 );
				ACTION_SetLookAtTargetDirect( AP_Corrion , LT_Intro_06 , TRUE );	

				ACTION_SetLookAtTargetDirect( AP_Allen , LT_Intro_03 , TRUE );
				ACTION_PlayAnimWithQueueDirect( AP_Allen , 'crouched_idle_b_1' , 0.5 , 1.0 );
				ACTION_PlayLipSyncSoundDirect( AP_Allen , "D00_1630.ALLEN_B", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "ALLEN_B" ) , 1.2 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 1.16 / -----ALLEN_B="Allen: Oh shit."

					WaitForAbsoluteTime( i += 0.9 );
				ACTION_SetLookAtTargetDirect( AP_Garnett , LT_Intro_01 , TRUE );	
					WaitForAbsoluteTime( i += 0.6 );
				ACTION_SetLookAtTargetDirect( AP_Allen , LT_Intro_Center , TRUE );

				ACTION_PlayAnimWithQueueDirect( AP_Garnett , 'crouched_idle_a_1' , 0.5 , 1.0 );
				ACTION_PlayLipSyncSoundDirect( AP_Garnett , "D00_1630.GARNETT_A", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "GARNETT_A1" ) , 6.5 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 6.50 / -----GARNETT_A1="Garnett: Asshole.  Your mouth is too big.  Every God damn day I say it.  Your mouth is too big."
					WaitForAbsoluteTime( i += 1.1 );
				ACTION_SetLookAtTargetDirect( AP_Corrion , AP_Garnett , TRUE );	
					WaitForAbsoluteTime( i += 1.2 );
				ACTION_SetLookAtTargetDirect( AP_Allen , AP_Baker , TRUE );
					WaitForAbsoluteTime( i += 1.6 );
				ACTION_SetLookAtTargetDirect( AP_Garnett , LT_Intro_07 , TRUE );	
					WaitForAbsoluteTime( i += 2.1 );
				ACTION_SetLookAtTargetDirect( AP_Garnett , LT_Intro_01 , TRUE );	
					WaitForAbsoluteTime( i += 0.8 );
				ACTION_SetLookAtTargetDirect( AP_Corrion , LT_Intro_Center , TRUE );	
				ACTION_DisplaySubTitleMessage2( S_Localize( "GARNETT_A2" ) , 1.3 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 2.25 / -----GARNETT_A2="Garnett: You could fit a bass in there."

					WaitForAbsoluteTime( i += 0.6 );
				ACTION_SetLookAtTargetDirect( AP_Allen , LT_Intro_Center , TRUE );
					WaitForAbsoluteTime( i += 0.7 );
				ACTION_SetLookAtTargetDirect( AP_Garnett , LT_Intro_Center , TRUE );	

				ACTION_TriggerEvent( 'Event_SS_Intro_Baker_Just_Remember' );	
				ACTION_PlayLipSyncSoundDirect( AP_Baker , "D00_1630.BAKER_E", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "BAKER_E1" ) , 3.8 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 3.75 / -----BAKER_E1="Baker: Red.  Just remember all the stuff we went over.  Put fire on 'em before you make your move."
					WaitForAbsoluteTime( i += 3.9 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "BAKER_E2" ) , 2.3 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 2.25 / -----BAKER_E2="Baker: Fix 'em then flank 'em.  That's key."
					WaitForAbsoluteTime( i += 2.5 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "BAKER_E3" ) , 2.3 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 2.35 / -----BAKER_E3="Baker: No one dies today."
	
					WaitForAbsoluteTime( i += 1.0 );
				ACTION_SetLookAtTargetDirect( AP_Corrion , AP_Baker , TRUE );
					WaitForAbsoluteTime( i += 1.8 );

				ACTION_SetLookAtTargetDirect( AP_Allen , AP_Baker , TRUE );
				ACTION_PlayAnimWithQueueDirect( AP_Allen , 'crouched_idle_b_1' , 0.5 , 1.0 );
				ACTION_PlayLipSyncSoundDirect( AP_Allen , "D00_1630.ALLEN_C", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "ALLEN_C1" ) , 1.3 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 1.25 / -----ALLEN_C1="Allen: Well that's good news then."
					WaitForAbsoluteTime( i += 0.3 );
				ACTION_SetLookAtTargetDirect( AP_Garnett , LT_Intro_01 , TRUE );	
					WaitForAbsoluteTime( i += 1.0 );

				ACTION_SetLookAtTargetDirect( AP_Allen , AP_Garnett , TRUE );
				ACTION_DisplaySubTitleMessage2( S_Localize( "ALLEN_C2" ) , 1.4 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 2.35 / -----ALLEN_C2="Allen: Oh shit I did it again didn't I?"

					WaitForAbsoluteTime( i += 0.6 );
				ACTION_SetLookAtTargetDirect( AP_Garnett , LT_Intro_07 , TRUE );	
					WaitForAbsoluteTime( i += 0.8 );
				ACTION_SetLookAtTargetDirect( AP_Allen , LT_Intro_05 , TRUE );

				ACTION_TriggerEvent( 'Event_SS_Intro_Baker_Macs_Patrol' );	
				ACTION_PlayLipSyncSoundDirect( AP_Baker , "D00_1630.BAKER_F", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "BAKER_F1" ) , 4.5 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 4.50 / -----BAKER_F1="Baker: Mac's patrol is coming in from the other side of town. We'll all meet back together after it's done."
					WaitForAbsoluteTime( i += 2.0 );
				ACTION_SetLookAtTargetDirect( AP_Allen , LT_Intro_07 , TRUE );
					WaitForAbsoluteTime( i += 2.6 );
				ACTION_SetLookAtTargetDirect( AP_Garnett , LT_Intro_07 , TRUE );	

				ACTION_DisplaySubTitleMessage2( S_Localize( "BAKER_F2" ) , 1.6 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 1.50 / -----BAKER_F2="Baker: We've got work to do."

				ACTION_SetLookAtTargetDirect( AP_Corrion , LT_Intro_Center , TRUE );
					WaitForAbsoluteTime( i += 0.6 );
				ACTION_SetLookAtTargetDirect( AP_Allen , LT_Intro_05 , TRUE );
					WaitForAbsoluteTime( i += 0.7 );
				ACTION_SetLookAtTargetDirect( AP_Garnett , LT_Intro_06 , TRUE );	
					WaitForAbsoluteTime( i += 1.1 );

				ACTION_ClearLookAtTargetDirect( AP_Allen );
				ACTION_ClearLookAtTargetDirect( AP_Doyle );
				ACTION_ClearLookAtTargetDirect( AP_Garnett );

//=============================================================================

		//========== CHARACTERS EXIT SCENE
				ACTION_TriggerEvent( 'TS_D00_1630_Intro_Exit_Extras' );

					WaitForAbsoluteTime( i+= 2.0 );

		//========== SQUAD STANDS UP
				ACTION_UnBlockActionKeys( KEY_ACTION_CROUCH  );
				GetLocalPlayerPawn().ForceUnCrouch();
				ACTION_PlayAnimWithQueueDirect( AP_Allen , 'crouched_idle_b_dismount' , 0.1 , 1.0 );
				ACTION_PlayAnimWithQueueDirect( AP_Doyle , 'crouched_idle_a_dismount' , 0.1 , 1.0 );
				ACTION_PlayAnimWithQueueDirect( AP_Friar , 'crouched_idle_c_dismount' , 0.1 , 1.0 );
				ACTION_PlayAnimWithQueueDirect( AP_Garnett , 'crouched_idle_a_dismount' , 0.1 , 1.0 );
				ACTION_PlayAnimWithQueueDirect( AP_Paddock , 'crouched_idle_c_dismount' , 0.1 , 1.0 );

				ACTION_ClearPawnIdleQueue( 'Allen' );
				ACTION_ClearPawnIdleQueue( 'Doyle' );
				ACTION_ClearPawnIdleQueue( 'Garnett' );
				ACTION_ClearPawnIdleQueue( 'Friar' );
				ACTION_ClearPawnIdleQueue( 'Paddock' );

					sleep( 1.6 );

				ACTION_PlayAnimWithQueueDirect( AP_Allen , 'standing_idle_combat_1' , 0.3 , 1.0 , , 1 );
				ACTION_PlayAnimWithQueueDirect( AP_Doyle , 'standing_idle_combat_1' , 0.3 , 1.0 , , 1 );
				ACTION_PlayAnimWithQueueDirect( AP_Garnett , 'standing_idle_combat_1' , 0.3 , 1.0 , , 1 );

					sleep( 0.5 );

				ACTION_PlayAnimWithQueueDirect( AP_Friar , 'standing_idle_combat_1' , 0.3 , 1.0 , , 1 );
				ACTION_PlayAnimWithQueueDirect( AP_Paddock , 'standing_idle_combat_1' , 0.3 , 1.0 , , 1 );

				ACTION_ChangeControllerDirect( AP_Allen, class'Mind' );
				ACTION_ChangeControllerDirect( AP_Doyle , class'Mind' );
				ACTION_ChangeControllerDirect( AP_Garnett , class'Mind' );

					sleep( 0.4 );

				ACTION_ChangeControllerDirect( AP_Friar , class'Mind' );
				ACTION_ChangeControllerDirect( AP_Paddock , class'Mind' );

    			ACTION_UnSetAnimSetDirect( AP_Hartsock , "a_cin_d00_Three_patrol_action.a_cin_d00_Three_patrol_action" );
    			ACTION_UnSetAnimSetDirect( AP_Garnett , "a_cin_d00_Three_patrol_action.a_cin_d00_Three_patrol_action" );
    			ACTION_UnSetAnimSetDirect( AP_Allen , "a_cin_d00_Three_patrol_action.a_cin_d00_Three_patrol_action" );
    			ACTION_UnSetAnimSetDirect( AP_Doyle , "a_cin_d00_Three_patrol_action.a_cin_d00_Three_patrol_action" );
    			ACTION_UnSetAnimSetDirect( AP_Paddock , "a_cin_d00_Three_patrol_action.a_cin_d00_Three_patrol_action" );
    			ACTION_UnSetAnimSetDirect( AP_Friar , "a_cin_d00_Three_patrol_action.a_cin_d00_Three_patrol_action" );

//=============================================================================

			//===== Checkpoint
				ACTION_TriggerEvent( 'TriggeredScriptIntro' );
				ACTION_BlockActionKeys( -1 );
				ACTION_UnBlockActionKeys( KEY_ACTION_SHOW_MENU + KEY_ACTION_LOOK + KEY_ACTION_CONTINUE );
				ACTION_BlockActionKeys( KEY_ACTION_JUMP );

			//===== Waypoint
				ACTION_TriggerEvent( 'GBXWPB_01' );

					sleep( 7.6 );

//=============================================================================

		if ( !ACTION_IsTrainingDisabled() )
			{
				ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_A" ), 0.0 );
					//-----/-----TRAINING_A="You now have both a fire team and an assault team under your command.%newline%%newline%%icon_continue% to Continue."
				ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE );

				ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_B" ), 0.0 );
					//-----/-----TRAINING_B="Remember, the fire team %icon_team_fire% is ideal for suppressing the enemy.%newline%%newline%%icon_continue% to Continue."
				ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE );

				ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_C" ), 0.0 );
					//-----/-----TRAINING_C="The assault team %icon_team_Assault%, equipped with rifles, sub-machineguns and grenades, is best at flanking the enemy’s position.%newline%%newline%%icon_continue% to Continue."
				ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE );

				ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_D" ), 0.0 );
					//-----/-----TRAINING_D="Either of these teams can be used to suppress or charge the enemy, but using the right team for the right job will improve your squad's effectiveness in combat.%newline%%newline%%icon_continue% to Continue."
				ACTION_WaitForInterceptedActionKeys( KEY_ACTION_CONTINUE );

				ACTION_UnBlockActionKeys( KEY_ACTION_TEAMSELECT );

				if( !Level.IsXbox() )
					{
						ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_E" ), 0.0 );
							//-----/-----TRAINING_E="%action_team_select% %icon_team_select% to select which team you want to issue an order to."
						ACTION_WaitForInterceptedActionKeys( KEY_ACTION_TEAMSELECT );
					}

				Else if( Level.IsXbox() )
					{
						ACTION_TriggerEvent( 'TS_D00_1630_Training_Toggle' );
						ACTION_UnblockXboxButtons( KEY_ACTION_FIRE_TEAM + KEY_ACTION_ASSAULT_TEAM );
						ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_XBOX_E" ), 0.0 );						
							//-----/----TRAINING_XBOX_E="%action_team_select% %icon_team_select% or %button_dpad% %button_L_arrow% to select which team you want to issue an order to."
 				 		while ( REF_Toggle.bSwitchTeams == FALSE )
							{
								sleep( 1.0 );
							}
					}

				if( !Level.IsXbox() )
					{
						ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_F" ), 0.0 );
							//-----/-----TRAINING_F="%action_team_select% %icon_team_select% to select your previous team."
						ACTION_WaitForInterceptedActionKeys( KEY_ACTION_TEAMSELECT );
					}

				Else if( Level.IsXbox() )
					{
						ACTION_UnblockXboxButtons( KEY_ACTION_FIRE_TEAM + KEY_ACTION_ASSAULT_TEAM );
						ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_XBOX_F" ), 0.0 );						
							//-----/----TRAINING_XBOX_F="%action_team_select% %icon_team_select% or %button_dpad% %button_R_arrow% to select your previous team."
 				 		while ( REF_Toggle.bSwitchTeamsBack == FALSE )
							{
								sleep( 1.0 );
							}
					}


					//-----/-----TRAINING_G="You are now equipped with grenades.  Grenades are useful for taking out multiple enemies at once.%newline%%newline%Press %icon_grenade% to throw a grenade."
				ACTION_UnBlockActionKeys( KEY_ACTION_THROW_GRENADE );
				ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_G" ), 0.0 );
				ACTION_WaitForInterceptedActionKeys( KEY_ACTION_THROW_GRENADE );

				ACTION_DisplayTrainingMessage( "" , 0.0 );
					//-----/-----Clear message
			}

//=============================================================================

				ACTION_UnBlockActionKeys( -1 );
				ACTION_LimitPlayerInput( GetLocalPlayerController(), FALSE );

					sleep( 0.2 );

			//===== Trigger script to wait for player to interrupt incendental dialogue
				ACTION_TriggerEvent( 'TS_D00_1630_Intro_Command_Check' );

		//========== Continue intro dialogue
				ACTION_SetLookAtTargetDirect( AP_Paddock , AP_Friar , TRUE );
				ACTION_PlayLipSyncSoundDirect( AP_Paddock , "D00_1630.PADDOCK_A", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "PADDOCK_A" ) , 3.6 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 3.21 / -----PADDOCK_A="Paddock: You were with Sarge when he died? How'd it happen?"

					sleep( 0.7 );
				ACTION_SetLookAtTargetDirect( AP_Friar , AP_Paddock , TRUE );
					sleep( 1.4 );
				ACTION_SetLookAtTargetDirect( AP_Paddock , AP_Allen , TRUE );
					sleep( 2.1 );

				ACTION_SetLookAtTargetDirect( AP_Friar , LT_Intro_02 , TRUE );
				ACTION_PlayLipSyncSoundDirect( AP_Friar , "D00_1630.FRIAR_A", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "FRIAR_A" ) , 2.7 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 2.69 / -----FRIAR_A="Friar: I wasn't with him really... just sorta found him."

					sleep( 0.4 );
				ACTION_SetLookAtTargetDirect( AP_Paddock , LT_Intro_02 , TRUE );
					sleep( 1.2 );
				ACTION_SetLookAtTargetDirect( AP_Friar , AP_Paddock , TRUE );
					sleep( 1.1 );

				ACTION_ClearLookAtTargetDirect( AP_Friar );
				ACTION_ClearLookAtTargetDirect( AP_Paddock );

				ACTION_PlayLipSyncSoundDirect( AP_Allen , "D00_1630.ALLEN_D", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "ALLEN_D" ) , 1.9 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 1.88 / -----ALLEN_D="Allen: So why a bass?"

					sleep( 1.7 );

				ACTION_PlayLipSyncSoundDirect( AP_Garnett , "D00_1630.GARNETT_B", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "GARNETT_B" ) , 4.0 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 4.01 / -----GARNETT_B="Garnett: I dunno, I panicked... needed something really big to make my point."

					sleep( 3.8 );

				ACTION_PlayLipSyncSoundDirect( AP_Allen , "D00_1630.ALLEN_E", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "ALLEN_E" ) , 4.4 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 4.40 / -----ALLEN_E="Allen: I stuck one of those donuts from Fort Bragg mess hall in my mouth once.  Whole thing."

					sleep( 4.1 );

				ACTION_PlayLipSyncSoundDirect( AP_Garnett , "D00_1630.GARNETT_C", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "GARNETT_C" ) , 2.0 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 1.97 / -----GARNETT_C="Garnett: You mean those rocks they called donuts?"

					sleep( 2.1 );

				ACTION_PlayLipSyncSoundDirect( AP_Allen , "D00_1630.ALLEN_F", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize( "ALLEN_F1" ) , 2.2 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 2.25 / -----ALLEN_F1="Allen: Yeah I know.  I almost choked to death on it."

					sleep( 2.3 );

				ACTION_DisplaySubTitleMessage2( S_Localize( "ALLEN_F2" ) , 2.8 , 1 , 1 , 1 , TRUE , TRUE );
					//-----/ 2.75 / -----ALLEN_F2="Allen: Desola still owes me six bucks for that."

					sleep( 2.8 );

					StopAbsoluteTime();

				getFirstActor( 'TS_D00_1630_Intro_Command_Check' ).goToState( 'Complete' );
				GoToState( 'Complete' );
	}

state Command
	{
		Begin:
			Slog( "-----/----------/-----PLAYER HAS INTERRUPTED INCENDENTAL DIALOGUE-----/----------/-----" );
					sleep( 3.0 );
		ScriptEnd:
	}

//=============================================================================

state Complete
	{
		Begin:

			Slog( "-----/----------/-----INTRO SCRIPT COMPLETE-----/----------/-----" );

				ACTION_EnableTalkToMessageForCharacter( 'Allen' );
				ACTION_EnableTalkToMessageForCharacter( 'Doyle' );
				ACTION_EnableTalkToMessageForCharacter( 'Garnett' );
				ACTION_EnableTalkToMessageForCharacter( 'Friar' );
				ACTION_EnableTalkToMessageForCharacter( 'Paddock' );

				ACTION_EnableBattleDialogueForCharacter( 'Allen' );
				ACTION_EnableBattleDialogueForCharacter( 'Doyle' );
				ACTION_EnableBattleDialogueForCharacter( 'Garnett' );
				ACTION_EnableBattleDialogueForCharacter( 'Friar' );
				ACTION_EnableBattleDialogueForCharacter( 'Paddock' );

//		if ( !ACTION_IsTrainingDisabled() )
//			{
//					//-----/-----TRAINING_G="You are now equipped with grenades.  Grenades are useful for taking out multiple enemies at once.%newline%%newline%Press %icon_grenade% to throw a grenade."
//				ACTION_DisplayTrainingMessage( S_Localize( "TRAINING_G" ), 4.0 );
//			}

		ScriptEnd:
	}

