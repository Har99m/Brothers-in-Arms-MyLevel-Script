//=============================================================================
// TS_D000230_Intro.
//=============================================================================
class TS_D000230_Intro extends TriggeredScript
	placeable;

var AnimPawn AP_Hartsock, AP_Paddock, AP_Friar, AP_Marsh, AP_Doyle;
var AnimPawn AP_German_01 , PAWN_Intro_g2, PAWN_Intro_g3, PAWN_Intro_g4 , AP_Intro_German_Hat ;
var ActorLite PN_Intro_German , PN_Intro_Doyle ;
var Actor LT_Hang_01 , LT_Hang_02 , LT_Hang_03 , LT_Hang_04 , LT_Hang_05 , LT_Hang_Center ;
	//===== LT ordering starts facing Hartsock in tree going clockwise
var float i;
var Actor BLOODFACE;

State Triggered
	{
		Begin:
				ACTION_BlockActionKeys( KEY_ACTION_SA_VIEW + KEY_ACTION_TEAMSELECT );
			//===== Spawn in Doyle and Intro German
				ACTION_TriggerEvent('CSU_Intro');

			//===== Trigger fake events to start ScriptedSequences for German & Hartsock
				ACTION_TriggerEvent( 'Event_Start_Intro_Hartsock' );
				ACTION_TriggerEvent( 'Event_Start_Intro_German' );
				ACTION_TriggerEvent( 'Event_SS_Intro_German_Setup' );

				ACTION_TriggerEvent( 'BVT_Doyle_Jump' );
				ACTION_TriggerEvent( 'BV_Horse' );

				ACTION_SetUnitHiddenOnCompass( 'Unit_US_Assault' , TRUE );

				AP_Doyle =  AnimPawn( Getpawn( 'AP_Doyle' ));
				AP_German_01 = AnimPawn( GetPawn( 'AP_Intro_German' ));
				AP_Intro_German_Hat = AnimPawn( GetPawn( 'AP_Intro_German_Hat' ));

				ACTION_DisableBattleDialogueForCharacter( 'AP_Doyle' );

				LT_Hang_01 = GetFirstActor( 'LT_Hang_01' );
				LT_Hang_02 = GetFirstActor( 'LT_Hang_02' );
				LT_Hang_03 = GetFirstActor( 'LT_Hang_03' );
				LT_Hang_04 = GetFirstActor( 'LT_Hang_04' );
				LT_Hang_05 = GetFirstActor( 'LT_Hang_05' );
				LT_Hang_Center = GetFirstActor( 'LT_Hang_Center' );

				PN_Intro_German = GetNavigationPoint( 'PN_Intro_German' );
				PN_Intro_Doyle = GetNavigationPoint( 'PN_Intro_Doyle' );

				BLOODFACE = getFirstActor('PFX_BLOODFACE');

				AP_German_01.AttachToBone( AP_Intro_German_Hat , 'hat' );

				AP_Doyle.bHidden = TRUE ;

					i = 0.0 ;
					ResetAbsoluteTime();
					StartAbsoluteTime();

					WaitForAbsoluteTime( i+= 36.0 );

			//===== Start Hartsock's headride
				ACTION_TriggerEvent( 'TS_D000230_IntroRide' );

					WaitForAbsoluteTime( i+= 10.0 );

				ACTION_TriggerEvent( 'Event_Intro_German_02' );
				WaitForAbsoluteTime( i+= 1.75 );

					//-----/ 1.67 /-----GERMAN_A="German: You shouldn't be here. You shouldn't be..."
				ACTION_PlayLipSyncSoundDirect( AP_German_01 , "D00_0230.GERMAN_A", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize("GERMAN_A"), 3.0 , 1, 1, 1, TRUE, TRUE );
					WaitForAbsoluteTime( i+= 1.5 );
				ACTION_PlaySoundDirect( AP_Doyle , "W_M1CARBINE.FIRE" , 1 , 1 , 2048 );
				ACTION_PlaySoundDirect( AP_German_01, "IMPACTS.bullet_wood", 1, 1, 2048 );
				ACTION_TriggerEvent( 'gbxET_Intro_Shot_01' );

					WaitForAbsoluteTime( i+= 0.7 );

				AP_Doyle.bHidden = FALSE ;

					//-----/ 1.38 /-----GERMAN_B="German: Shit! Shit!"
				ACTION_PlayLipSyncSoundDirect( AP_German_01 , "D00_0230.GERMAN_B", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubTitleMessage2( S_Localize("GERMAN_B"), 2.0 , 1, 1, 1, TRUE, TRUE );

					WaitForAbsoluteTime( i+= 2.8 );

				ACTION_PlaySoundDirect( AP_Doyle , "W_M1CARBINE.FIRE" , 1 , 1 , 2048 );
				ACTION_PlaySoundDirect( AP_German_01 , "IMPACTS.BULLET_BODY" , 1 , 1 , 2048 );
				ACTION_TriggerEvent( 'gbxET_Intro_Shot_02' );

				AP_German_01.RemoveExtendedAttachment( 'head', 'heinrick' );
				AP_German_01.ExtendedSkins[0] = Texture't_character_de.Infantry.de_conscript_craig_shot';
				AP_German_01.AddExtendedAttachment( 'head', 'heinrick_shot' );
				ACTION_TriggerEvent('PFX_BLOODFACE');
				AP_German_01.AttachToBone( BLOODFACE, 'blender' );
					WaitForAbsoluteTime( i+= 0.3 );
				ACTION_PlaySoundDirect( AP_German_01, "BD_SP_GER_E.M_DEATH_A", 0.5, 1, 102 );
					WaitForAbsoluteTime( i+= 1.2 );

				ACTION_PlaySoundDirect( AP_German_01, "IMPACTS.BODY_GROUND", 1, 1, 2048 );
					WaitForAbsoluteTime( i+= 0.5 );
				ACTION_TriggerEvent('PFX_BLOODLEAK');
					WaitForAbsoluteTime( i+= 2.0 );
				ACTION_MoveToward( AP_Doyle , PN_Intro_Doyle , FALSE );

			//===== Wait for event triggered by Doyle near tree
				ACTION_WaitForEvent( 'DoyleAtTree' );

		//===== DIALOGUE
				ACTION_TriggerEvent( 'Event_Start_Intro_Doyle' );

					i = 0.0 ;
					ResetAbsoluteTime();
					StartAbsoluteTime();

					WaitForAbsoluteTime( i+= 0.2 );

				ACTION_PlayLipSyncSoundDirect( AP_Doyle , "D00_0230.DOYLE_A", 1.0, 1.0, 1.0, ,'bottom_lip' );
					//-----/ 3.00 /-----DOYLE_A1="Doyle: Sorry about that first shot... Thank me for the second one later."
				ACTION_DisplaySubTitleMessage2( S_Localize("DOYLE_A1"), 3.0 , 1, 1, 1, TRUE, TRUE );
					WaitForAbsoluteTime( i+= 3.3 );
					//-----/ 4.75 /-----DOYLE_A2="Doyle: For now, I guess it's just you and me.  Better get your rifle outta your leg bag so we can get movin'."
				ACTION_DisplaySubTitleMessage2( S_Localize("DOYLE_A2"), 4.7, 1, 1, 1, TRUE, TRUE );
					WaitForAbsoluteTime( i+= 5.2 );

				ACTION_TriggerEvent( 'Event_Intro_Hartsock_Drop' );

					WaitForAbsoluteTime( i+= 5.2 );

				ACTION_TriggerEvent( 'Emitter_Chutes' );
				ACTION_TriggerEvent( 'Emitter_Planes' );

				ACTION_ClearLookAtTargetDirect( AP_Doyle );
				ACTION_BlockActionKeys( KEY_ACTION_ORDER + KEY_ACTION_FALL_OUT + KEY_ACTION_FALL_IN + KEY_ACTION_TEAMSELECT );
				ACTION_ChangeControllerDirect( AP_Doyle ,class'Mind' );
				ACTION_DisableBattleDialogueForCharacter( 'AP_Doyle' );
				ACTION_DisableBattleDialogue();
				ACTION_OrderFallIn( 'Unit_US_Assault' );
				ACTION_RestoreUnlimitedAmmo( AP_Doyle, class'gbxInventory.WeapUSM1_' );

			//===== Unlock player + checkpoint
				GetLocalPlayerPawn().bHidden = False;
				ACTION_TriggerEvent('TriggeredScriptIntro');

					StopAbsoluteTime();

					sleep( 0.1 );

			if ( !ACTION_IsTrainingDisabled() )
				{
					ACTION_LockPlayerMovement( GetLocalPlayerPawn() );
				}

					sleep( 3.9 );

			//===== Trigger training script
				ACTION_TriggerEvent( 'TS_D000230_Training' );
	}
