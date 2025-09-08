//=============================================================================
// TS_D02_2300_IntroScene.
//=============================================================================
class TS_D02_2300_IntroScene extends TriggeredScript
	placeable;

var float i;
var AnimPawn AP_Hartsock, AP_Garnett, AP_Allen, AP_Paddock, AP_Marsh, AP_Friar, AP_Desola;

state Triggered
	{
			function OnTrigger()
				{
					GotoState( 'Dialogue' );
				}
		Begin:

			//===== Spawn intro characters
				ACTION_TriggerEvent( 'CSU_IntroCharacters' );

			//=====	Hide Outro Truck
				ACTION_SetHidden( 'SM_OutroTruck', true );
				ACTION_SetHidden( 'AP_Mac', true );
				ACTION_SetHidden( 'AP_Baker', true );

			//===== Define Characters as AnimPawn Actors
				AP_Hartsock = AnimPawn( GetPawn( 'Hartsock' ));
				AP_Allen = AnimPawn( GetPawn( 'Allen' ));
				AP_Garnett = AnimPawn( GetPawn( 'Garnett' ));
				AP_Desola = AnimPawn( GetPawn( 'Desola' ));

			//===== Define Animpawns AnimSets

				ACTION_SetAnimSetDirect( AP_Garnett, "a_cin_d02_chateau.a_cin_d02_chateau" );
				ACTION_SetAnimSetDirect( AP_Allen, "a_cin_d02_chateau.a_cin_d02_chateau" );

				AP_Hartsock.bDoHeadTurn = True;
				AP_Allen.bDoHeadTurn = True;
				AP_Garnett.bDoHeadTurn = True;
				AP_Desola.bDoHeadTurn = True;

				ACTION_ClearPawnIdleQueue( 'Allen' );
				ACTION_AddAnimToPawnIdleQueue( 'Allen', 'Sad_idle_1' );
				ACTION_PlayAnimFromPawnIdleQueue( 'Allen', FALSE );

				ACTION_ClearPawnIdleQueue( 'Garnett' );
				ACTION_AddAnimToPawnIdleQueue( 'Garnett', 'standing_idle_relaxed_3'  );
				ACTION_PlayAnimFromPawnIdleQueue( 'Garnett', FALSE );

				ACTION_ClearPawnIdleQueue( 'Desola' );
				ACTION_AddAnimToPawnIdleQueue( 'Desola', 'standing_idle_relaxed_2' );
				ACTION_AddAnimToPawnIdleQueue( 'Desola', 'standing_idle_relaxed_3' );
				ACTION_PlayAnimFromPawnIdleQueue( 'Desola', FALSE );


				ACTION_SetLookAtTarget( 'Garnett', getFirstActor('LT_Mortar2_Path05'), True );
				ACTION_SetLookAtTarget( 'Desola', getFirstActor('LT_Mortar2_Path05'), True );
	}

state Dialogue
	{
		Begin:

			//===== Start Dialogue

				i = 3.0;

					ResetAbsoluteTime();
					StartAbsoluteTime();

					WaitForAbsoluteTime( i );

			//-----/----- 	Ext. Heisville - night
			//-----/-----	DESOLA, ALLEN, GARNETT are outside the entrance to the chateau reviewing their orders.  They are crouched staring up towards it.

//GARNETT_A="Garnett: This would have been a nice lil house if we hadn't bombed the holy shit out of it."

				ACTION_PlayAnim( 'Garnett', 'Standing_Chatting_2', 0.5, 1.0, False, 16.0,  );

				ACTION_PlayLipSyncSound( 'Garnett', "D02_2300.GARNETT_A", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubtitleMessage2(S_Localize("GARNETT_A" ), 4.0, 1 , 1 , 1 , , TRUE );
					WaitForAbsoluteTime( i+= 0.2 );
				AP_Garnett.bDoHeadTurn = False;
					WaitForAbsoluteTime( i+= 1.3 );
				ACTION_PlayAnim( 'Garnett', 'garnett_intro_dialogue', 0.5, 1.0, False, 0.0,  );
			//	ACTION_PlayAnim( 'Garnett', 'Johnson_intro_idle', 0.5, 1.0, True, 0.0,  );

				ACTION_SetLookAtTarget( 'Desola', AP_Garnett, True );
					WaitForAbsoluteTime( i+= 1.5 );
				AP_Garnett.bDoHeadTurn = True;
				ACTION_SetLookAtTarget( 'Garnett', getFirstActor('LT_Mortar2_Path04'), True );
					WaitForAbsoluteTime( i+= 0.7 );


//DESOLA_A="Desola: Just recon right?"
				ACTION_PlayLipSyncSound( 'Desola', "D02_2300.DESOLA_A", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubtitleMessage2(S_Localize("DESOLA_A" ), 2.1, 1 , 1 , 1 , , TRUE );

					WaitForAbsoluteTime( i+= 1.5 );

//GARNETT_B="Garnett: I don't know Desola.  Everytime I hear the words "scout it" or "recon", I bring extra ammo."
				AP_Garnett.bDoHeadTurn = False;


				ACTION_PlayLipSyncSound( 'Garnett', "D02_2300.GARNETT_B", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubtitleMessage2(S_Localize("GARNETT_B" ), 5.5, 1 , 1 , 1 , , TRUE );
					WaitForAbsoluteTime( i+= 5.0 );
				ACTION_PlayAnim( 'Garnett', 'Standing_idle_relaxed_3', 0.7, 1.0, True, 0.0,  );
					WaitForAbsoluteTime( i+= 1.0 );
				ACTION_SetLookAtTarget( 'Desola', getFirstActor('LT_Mortar2_Path05'), True );

					WaitForAbsoluteTime( i+= 1.0 );
//ALLEN_A="Allen: Seems like it's never over."
				ACTION_PlayAnimWithQueue( 'Allen', 'Sad_idle_2', 0.2, 1.0, False, 0.0,  );

				ACTION_PlayLipSyncSound( 'Allen', "D02_2300.ALLEN_A", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubtitleMessage2(S_Localize("ALLEN_A" ), 2.4, 1 , 1 , 1 , , TRUE );
					WaitForAbsoluteTime( i+= 2.0 );

//GARNETT_C="Garnett: What?"
				AP_Garnett.bDoHeadTurn = True;
				ACTION_SetLookAtTarget( 'Garnett', AP_Allen, True );
					WaitForAbsoluteTime( i+= 0.5 );
				ACTION_PlayLipSyncSound( 'Garnett', "D02_2300.GARNETT_C", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubtitleMessage2(S_Localize("GARNETT_C" ), 1.3, 1 , 1 , 1 , , TRUE );
					WaitForAbsoluteTime( i+= 1.4 );

				ACTION_SetLookAtTarget( 'Desola', AP_Allen, True );


//ALLEN_B="Allen: Just thinking outloud."
				ACTION_PlayAnimWithQueue( 'Allen', 'Sad_idle_2', 0.2, 1.0, False, 0.0,  );

				ACTION_PlayLipSyncSound( 'Allen', "D02_2300.ALLEN_B", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubtitleMessage2(S_Localize("ALLEN_B" ), 2.4, 1 , 1 , 1 , , TRUE );
				
					WaitForAbsoluteTime( i+= 2.5 );

//DESOLA_B1="Desola: Well I don't know about you Allen but I ain't gettin shot over a stupid chateau."
				ACTION_PlayAnimWithqueue( 'Desola', 'Standing_chatting_5', 0.4, 1.1, False, 0.0,  );
				ACTION_PlayLipSyncSound( 'Desola', "D02_2300.DESOLA_B", 1.0, 1.0, 1.0 );
				ACTION_DisplaySubtitleMessage2(S_Localize("DESOLA_B1" ), 3.4, 1 , 1 , 1 , , TRUE );
					WaitForAbsoluteTime( i+= 1.4 );
	ACTION_SetLookAtTarget( 'Garnett', AP_Desola, True );
					WaitForAbsoluteTime( i+= 2.0 );
				
	//DESOLA_B2="Desola: Let's get moving."
			ACTION_PlayAnim( 'Allen', 'Standing_idle_relaxed_3', 0.4, 1.0, True, 0.0,  );
ACTION_SetLookAtTarget( 'Allen', AP_Garnett, True );
				ACTION_DisplaySubtitleMessage2(S_Localize("DESOLA_B2" ), 2.0, 1 , 1 , 1 , , TRUE );
					WaitForAbsoluteTime( i+= 2.0 );
				AP_Allen.Controller.Focus = AP_Garnett;
				AP_Desola.Controller.Focus = getFirstActor('LT_Intro_Turn');
				ACTION_SetLookAtTarget( 'Garnett', AP_Allen, True );
					WaitForAbsoluteTime( i+= 0.3 );
				AP_Allen.Controller.Focus = getFirstActor('LT_Intro_Turn');
				AP_Garnett.Controller.Focus = getFirstActor('LT_Intro_Turn');
					WaitForAbsoluteTime( i+= 0.2 );
//=============================================================================

			//-----/----- HARTSOCK can move around and command his men as the V.O. plays.

		//===== CHANGE TO MIND CONTROLLER
				ACTION_ChangeController( 'Garnett', class'Mind' );
				ACTION_ChangeController( 'Allen', class'Mind' );
				ACTION_ChangeController( 'Desola', class'Mind' );

					WaitForAbsoluteTime( i+= 2.0 );

//slomo scene

				GetLocalplayerController().EnableSoundCategory( ESoundCategory.SC_AMBIENT , false , 1.5 );	
				GetLocalplayerController().EnableSoundCategory( ESoundCategory.SC_CINEMATIC , false , 1.5 );
		//		GetLocalplayerController().EnableSoundCategory( ESoundCategory.SC_SOUNDFX	 , false , 1.5 );	

				ACTION_TriggerEvent( 'Scene_Slomo' );

				ACTION_BlockActionKeys( -1 );
				ACTION_UnBlockActionKeys( KEY_ACTION_MOVE + KEY_ACTION_LOOK );
				ACTION_DesaturateCamera( 3000.0 );

					i=0.0;
					ResetAbsoluteTime();
					StartAbsoluteTime();

	// MARSHALL_C="Marshall: What's wrong"
				ACTION_PlayLocalSound( "D02_2300.MARSHALL_C" );
				ACTION_DisplaySubtitleMessage2(S_Localize( "MARSHALL_C" ), 0.3, 1, 1, 1, TRUE, TRUE );
					WaitForAbsoluteTime( i += 0.3 );

	// HARTSOCK_C1="Hartsock: Allen and Garnett died the next morning."

				ACTION_PlayLocalSound( "D02_2300.HARTSOCK_C" );
				ACTION_DisplaySubtitleMessage2(S_Localize( "HARTSOCK_C1" ), 0.3, 1 , 1 , 1 , TRUE, TRUE );
					WaitForAbsoluteTime( i += 0.5 );

	//HARTSOCK_C_2="Hartsock: Desola was the day after."
				ACTION_DisplaySubtitleMessage2(S_Localize( "HARTSOCK_C2" ), 0.35, 1 , 1 , 1 , TRUE, TRUE );
					WaitForAbsoluteTime( i += 0.5 );

	// MARSHALL_D_1="Marshall: Do you need a minute?"
				ACTION_PlayLocalSound( "D02_2300.MARSHALL_D" );
				ACTION_DisplaySubtitleMessage2(S_Localize( "MARSHALL_D1" ), 0.3, 1 , 1 , 1 , TRUE, TRUE );
					WaitForAbsoluteTime( i += 0.4 );

	//MARSHALL_D_2="Marshall: Sergeant Hartsock do you need a minute?"
				ACTION_DisplaySubtitleMessage2(S_Localize( "MARSHALL_D2" ), 0.3, 1 , 1 , 1 , TRUE, TRUE );
					WaitForAbsoluteTime( i += 0.4 );

	// HARTSOCK_E_1="Hartsock: No sir."
				ACTION_PlayLocalSound( "D02_2300.HARTSOCK_E" );
				ACTION_DisplaySubtitleMessage2(S_Localize( "HARTSOCK_E1" ), 0.3, 1 , 1 , 1 , TRUE, TRUE );
					WaitForAbsoluteTime( i += 0.4 );

	//HARTSOCK_E_2="Hartsock: I'm fine, let's keep going."
				ACTION_DisplaySubtitleMessage2(S_Localize( "HARTSOCK_E2" ), 0.3, 1 , 1 , 1 , TRUE, TRUE );
					WaitForAbsoluteTime( i += 0.4 );

					StopAbsoluteTime();

			//===== Trigger matinee scene to bring time back to normal speed and remove saturation
				ACTION_StopScene( 'Scene_Slomo' , 'Scene_Slomo_End' );

				ACTION_UnBlockActionKeys( -1 );
				ACTION_EndDesaturateCamera();

				GetLocalplayerController().EnableSoundCategory( ESoundCategory.SC_AMBIENT , true , 1.5 );	
				GetLocalplayerController().EnableSoundCategory( ESoundCategory.SC_CINEMATIC , true , 1.5 );
		//		GetLocalplayerController().EnableSoundCategory( ESoundCategory.SC_SOUNDFX	 , true , 1.5 );	

				ACTION_TriggerEvent('WP_obj0');
				ACTION_SetObjectiveStatus( 0, OI_Active, 'ObjectiveList' );
				ACTION_DisplayObjective( 0, 'ObjectiveList', 4.0 );
		ACTION_TriggerEvent( 'BVT_Outro');
				ACTION_TriggerEvent( 'TriggeredScriptIntro' );


				ACTION_TriggerEvent('gbxTrigger_TSC_C1_01');



//=============================================================================

			//-----/----- HARTSOCK leads his men up the entrance and begins clearing out the chateau of resistance.

	}

